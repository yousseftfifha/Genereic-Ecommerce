package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.SuppliesRepository;
import com.group3s2i.springboot.Model.Supplier;
import com.group3s2i.springboot.Model.Supplies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class SuppliesController {
    @Autowired
    SuppliesRepository suppliesRepository;

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
}
