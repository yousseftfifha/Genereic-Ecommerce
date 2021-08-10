package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.CartRepository;
import com.group3s2i.springboot.DAO.MouvementRepository;
import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.Model.Cart;
import com.group3s2i.springboot.Model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class CartController {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    private MouvementRepository mouvementRepository;
    @Autowired
    private ProductRepository productRepository;


    // get all cart
    @GetMapping("/cart/{customer}")
    public List<Cart> getAllCarts(@PathVariable Customer customer){
        return cartRepository.findAllByCustomerEquals(customer);
    }


    //create cart rest api
    @PostMapping("/cart")
    public Cart createCart(@RequestBody Cart cart){
        List<Cart> cartList=cartRepository.findAll();
        for (Cart cart1:cartList){
            if(cart1.getProduct ().getId ().equals (cart.getProduct ().getId ())){
                cart1.setQuantity (cart1.getQuantity ()+1);
                return cartRepository.save (cart1);
            }
        }
        return cartRepository.save (cart);
    }

    @PutMapping("/cart/{id}/")
    public ResponseEntity<Cart> updateCart(@PathVariable("id") long id, @RequestBody Cart cart) {
        System.out.println("Update cart with ID = " + id + "...");

        Optional<Cart> optionalCart = cartRepository.findById(id);

        if (optionalCart.isPresent()) {
            Cart cart1 = optionalCart.get();
           cart1.setProduct(cart.getProduct());
           cart1.setQuantity(cart.getQuantity());

            return new ResponseEntity<>(cartRepository.save(cart), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/cart/{id}")
    public Map<String, Boolean> deleteCategory(@PathVariable(value = "id") Long id)
            throws com.group3s2i.springboot.Exceptions.ResourceNotFoundException {
        Cart cart = cartRepository.findById(id)
                .orElseThrow(() -> new com.group3s2i.springboot.Exceptions.ResourceNotFoundException("Category not found  id :: " + id));

        cartRepository.delete(cart);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }
    @GetMapping("/cart/info")
    public Map<String, Double>  listCartItems() {
        List<Cart> cartList=cartRepository.findAll ();
        double totalCost=0.0;

        double itemCount=cartRepository.count ();
        Map<String, Double> response = new HashMap<>();
        response.put("itemCount", itemCount);
        response.put("totalCost", totalCost);

        return response;
    }

}
