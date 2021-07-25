package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.*;
import com.group3s2i.springboot.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class SuppliesController {
    @Autowired
    SuppliesRepository suppliesRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    MouvementRepository mouvementRepository;
    @Autowired
    ProductinformationRepository productinformationRepository;


    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/supplies")
    public ResponseEntity<Supplies> createSupplies(@RequestBody Supplies supplies) {
        supplies.getProduct ().setSupplies (supplies);
        supplies.getProductPrice ().setSupplies (supplies);
        suppliesRepository.save (supplies);
        List<Mouvement> mouvementList = new ArrayList<> ();
        Mouvement mouvement = new Mouvement ();
        mouvement.setProduct (supplies.getProduct ());
        mouvement.setQuantity (supplies.getQuantity ());
        mouvement.setType (0);
        mouvementList.add (mouvement);
        mouvementRepository.saveAll (mouvementList);
        Productinformation productinformation = new Productinformation ();
        productinformation.setProduct (supplies.getProduct ());
        productinformation.setMax (20);
        productinformation.setMin (5);
        productinformation.setSecurity (6);
        productinformation.setThreshold (6);
        productinformationRepository.save (productinformation);
        supplies.getProduct ().setMouvements (mouvementList);
        return ResponseEntity.ok (supplies);

    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplies")
    public List<Supplies> getAllSupplies() {
        System.out.println ("Get all Suppliers...");

        return new ArrayList<> (suppliesRepository.findAll ());
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplies/{id}")
    public Double price(@PathVariable("id") long id) {
        Optional<Product> product = productRepository.findById (id);
        Supplies supplies = suppliesRepository.findByProduct (product);
        Double prixVente = 0.0;
        prixVente = supplies.getUnitprice () + supplies.getProductPrice ().getVc () + supplies.getProductPrice ().getFv ();
        return prixVente;
    }
}
