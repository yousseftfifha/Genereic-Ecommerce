package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.ProductPriceRepository;
import com.group3s2i.springboot.DAO.ProductRepository;
import com.group3s2i.springboot.DAO.SuppliesRepository;
import com.group3s2i.springboot.Model.Product;
import com.group3s2i.springboot.Model.Supplier;
import com.group3s2i.springboot.Model.Supplies;
import org.springframework.beans.factory.annotation.Autowired;
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

    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/supplies")
    public Supplies createSupplies(@RequestBody Supplies supplies){
        supplies.getProduct ().setSupplies (supplies);

        return suppliesRepository.save (supplies);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplies")
    public List<Supplies> getAllSupplies() {
        System.out.println("Get all Suppliers...");

        return new ArrayList<> (suppliesRepository.findAll ());
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplies/{id}")
    public Double price(@PathVariable("id") long id) {
        System.out.println("Get  price...");
        Optional<Product> product=productRepository.findById (id);
        Supplies supplies=suppliesRepository.findByProduct (product);
        Double prixVente=0.0;
        prixVente=supplies.getUnitprice ()+supplies.getProductPrice ().getVc ()+supplies.getProductPrice ().getFv ();
        return prixVente;

    }
}
