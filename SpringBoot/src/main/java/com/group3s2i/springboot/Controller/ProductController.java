package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.MouvementRepository;
import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.Model.Category;
import com.group3s2i.springboot.Model.Product;
import com.sipios.springsearch.anotation.SearchSpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
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
    @Autowired
    MouvementRepository mouvementRepository;
//    @Autowired
//    ProductSupplierRepository productSupplierRepository;

    // get all products
    @GetMapping("/product")
    public List<Product> getAllProducts(){
        return productRepository.findAll ();
    }

    // get all products
    @GetMapping("/product/{keywords}")
    public ResponseEntity<List<Product>> search(@PathVariable String keywords){
        List<Product> product = productRepository.findAllByNameOrBrandOrCategoryName (keywords) ;
        return   ResponseEntity.ok(product);
    }
    // get product rest api
    @GetMapping("/product/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable long id){
        Product product = productRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("product does not exist with id :"+ id));
        return   ResponseEntity.ok(product);
    }
    @GetMapping("/product/price/{id}")
    public Double getPrice(@PathVariable long id){
        Product product=productRepository.findById (id)
                .orElseThrow(()-> new ResourceNotFoundException("product does not exist with id :"+ id));
        return mouvementRepository.avg (product)+product.getProductExtraCost ().getFixedCost ()+product.getProductExtraCost ().getVariableCost ()+product.getProductExtraCost ().getProfitMargin ();
    }

//    @PostMapping("/product")
//    public Product createProduct(@RequestBody Product product){
//        for(ProductDetails details:product.getDetails ()){
//            details.setProduct (product);
//        }
//        return productRepository.save (product);
//    }
//    @PostMapping("/product")
//    public ProductSupplier createProduct(@RequestBody ProductSupplier product){
//
//        return productSupplierRepository.save (product);
//    }

    //update product rest api

    @PutMapping("/product/{id}")
    public ResponseEntity<Product> updateProduct(@PathVariable("id") long id, @RequestBody Product product) {
        System.out.println("Update Product with ID = " + id + "...");

        Optional<Product> optionalProduct = productRepository.findById(id);

        if (optionalProduct.isPresent()) {
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
    @GetMapping("/product/category/{id}")
    public Optional<List<Product>> getCategoryByIdUP(@PathVariable Category id){
        return productRepository.findByCategory (id);

    }

    @GetMapping("/product/search")
    public ResponseEntity<List<Product>> searchForProduct(@SearchSpec Specification<Product> specs) {
        return new ResponseEntity<>(productRepository.findAll(Specification.where(specs)), HttpStatus.OK);
    }

}
