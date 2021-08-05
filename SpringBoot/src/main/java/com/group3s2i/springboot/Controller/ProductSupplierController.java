package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.MouvementRepository;
import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.DAO.ProductinformationRepository;
import com.group3s2i.springboot.DAO.SupplierRepository;
import com.group3s2i.springboot.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/product")
    public ResponseEntity<Params> createProductSupplier(@RequestBody Params params) {

        supplierRepository.save (params.getSupplier ()) ;
        Set<Supplier> suppliers = new HashSet<> ();
        suppliers.add (params.getSupplier ());
        params.getProduct ().setSuppliers (suppliers);
        productRepository.save (params.getProduct ()) ;
        List<Mouvement> mouvementList = new ArrayList<> ();
        Mouvement mouvement = new Mouvement ();
        mouvement.setProduct (params.getProduct ());
        mouvement.setQuantity (10);
        mouvement.setTypeMouvement ("IN");
        mouvement.setMouvementDate (LocalDateTime.now ());
        mouvementList.add (mouvement);
        mouvementRepository.saveAll (mouvementList);
        Productinformation productinformation = new Productinformation ();
        productinformation.setProduct (params.getProduct ());
        productinformation.setMax (20);
        productinformation.setMin (5);
        productinformation.setSecurity (6);
        productinformationRepository.save (productinformation);
        params.getProduct ().setMouvements (mouvementList);


        return ResponseEntity.ok (params);

    }
}

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
