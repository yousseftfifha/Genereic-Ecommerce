package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.Config.response.MessageResponse;
import com.group3s2i.springboot.DAO.*;
import com.group3s2i.springboot.Model.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class ProductSupplierController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    SupplierRepository supplierRepository;
    @Autowired
    MouvementRepository mouvementRepository;
    @Autowired
    ProductinformationRepository productinformationRepository;
    @Autowired
    ProductSupplierRepository productSupplierRepository;
    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/product")
    public ResponseEntity<?>  createProductSupplier(@RequestBody Params params) {

        supplierRepository.save (params.getSupplier ());
        Set<Supplier> suppliers = new HashSet<> ();
        suppliers.add (params.getSupplier ());
        params.getProduct ().setSuppliers (suppliers);

        ProductImage productImage=new ProductImage ();
        productImage.setProduct (params.getProduct ());
        productImage.setUrl ("http://localhost:8081/downloadFile/71Cc5uJ7f+L._AC_SL1500_.jpg");
        params.getProduct ().getProductImages ().add (productImage);

        productRepository.save (params.getProduct ()) ;

        List<Mouvement> mouvementList = new ArrayList<> ();
        Mouvement mouvement = new Mouvement ();
        mouvement.setProduct (params.getProduct ());
        mouvement.setQuantity (10);
        mouvement.setTypeMouvement ("IN");
        mouvement.setMouvementDate (LocalDateTime.now ());
        params.getProductSupplier ().id = new ProductSupplier.ProductSupplierId ();
        params.getProductSupplier ().id.product_id = params.getProduct ().getId ();
        params.getProductSupplier ().id.supplier_id = params.getSupplier ().getId ();
        params.getProductSupplier ().setCreatedDate (LocalDateTime.now ());

        productSupplierRepository.save(params.getProductSupplier ());
        mouvement.setUnitPrice (params.getProductSupplier ().getUnitPrice ());
        mouvementList.add (mouvement);

        mouvementRepository.saveAll (mouvementList);


        return ResponseEntity.ok(new MessageResponse ("Product and Supplier registered successfully! "));

    }
    @GetMapping("/product/supplier")
    public List<Product> getAllProducts(){
        return productRepository.findAll ();
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/product/count")
    public Long countProduct(){
        return productRepository.count ();
    }



}
@Getter
@Setter
@ToString
class Params {

    private Product product;
    private Supplier supplier;
    private ProductSupplier productSupplier;

    Product getProduct() {
        return product;
    }

    void setProduct(Product product) {
        this.product = product;
    }

    Supplier getSupplier() {
        return supplier;
    }

    void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    ProductSupplier getProductSupplier() {
        return productSupplier;
    }

    void setProductSupplier(ProductSupplier productSupplier) {
        this.productSupplier = productSupplier;
    }
}
