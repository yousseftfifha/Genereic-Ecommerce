package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.ProductDetailsRepository;
import com.group3s2i.springboot.Model.Product;
import com.group3s2i.springboot.Model.ProductDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class ProductDetailsController {

    @Autowired
    ProductDetailsRepository productDetailsRepository;

    // get all productDetails
    @GetMapping("/product/details")
    public List<ProductDetails> getAllProductsDetails(){
        return productDetailsRepository.findAll();
    }

    // get productDetail rest api
    @GetMapping("/product/{id}/details/{id}")
    public ResponseEntity<ProductDetails> getProductById(@PathVariable long id){
        ProductDetails productDetails = productDetailsRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("productDetail does not exist with id :"+ id));
        return   ResponseEntity.ok(productDetails);
    }

    //create productDetail rest api
    @PostMapping("/product/{id}/detail")
    public ProductDetails createProductDetail(@RequestBody ProductDetails productDetails){
        return productDetailsRepository.save (productDetails);
    }

    @PutMapping("/product/{id}/detail/{id}")
    public ResponseEntity<ProductDetails> updateProductDetail(@PathVariable("id") long id, @RequestBody ProductDetails productDetails) {
        System.out.println("Update Product with ID = " + id + "...");

        Optional<ProductDetails> optionalProductDetails = productDetailsRepository.findById(id);

        if (optionalProductDetails.isPresent()) {
            ProductDetails productDetails1 = optionalProductDetails.get();
            productDetails1.setAttribute(productDetails.getAttribute());
            productDetails1.setValue(productDetails.getValue());


            return new ResponseEntity<>(productDetailsRepository.save(productDetails), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/product/{id}/detail/{id}")
    public Map<String, Boolean> deleteDetail(@PathVariable(value = "id") Long id)
            throws com.group3s2i.springboot.Exceptions.ResourceNotFoundException {
        ProductDetails productDetails = productDetailsRepository.findById(id)
                .orElseThrow(() -> new com.group3s2i.springboot.Exceptions.ResourceNotFoundException("ProductDetail not found  id :: " + id));

        productDetailsRepository.delete(productDetails);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }
}
