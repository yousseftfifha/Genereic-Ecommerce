package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.Model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")

public class ProductController {

    @Autowired
    ProductRepository productRepository;

    // get all products
    @GetMapping("/product")
    public List<Product> getAllProducts(){
        return productRepository.findAll();
    }
    // get product rest api
    @GetMapping("/product/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable long id){
        Product product = productRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("product does not exist with id :"+ id));
        return   ResponseEntity.ok(product);
    }

    //create product rest api
    @PostMapping("/product")
    public Product createProduct(@RequestBody Product product){
         product.getDetails().setProductID(product);

        return productRepository.save (product);
    }

    //update product rest api

    @PutMapping("/product/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable("id") long id, @RequestBody Product product) {
        System.out.println("Update Product with ID = " + id + "...");

        Optional<Product> optionalProduct = productRepository.findById(id);

        if (optionalProduct.isPresent()) {
            Product product1 = optionalProduct.get();
            product1.setBrand(product.getBrand());
            product1.setCode(product.getCode());
            product1.setDescription(product.getDescription());
            product1.setIsbn(product.getIsbn());
            product1.setName(product.getName());
            product1.setSku(product.getSku());
            product1.setTmpCode(product.getTmpCode());
            product1.setCategoryID(product.getCategoryID());
            product1.setDetails(product.getDetails());
            return new ResponseEntity<>(productRepository.save(product), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    //delete product rest api

    @DeleteMapping("/product/{id}")
    public Map<String, Boolean> deleteCategory(@PathVariable(value = "id") Long id)
            throws com.group3s2i.springboot.Exceptions.ResourceNotFoundException {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new com.group3s2i.springboot.Exceptions.ResourceNotFoundException("Product not found  id :: " + id));

        productRepository.delete(product);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

}
