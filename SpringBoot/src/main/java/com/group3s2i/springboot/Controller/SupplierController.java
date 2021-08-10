package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.SupplierRepository;
import com.group3s2i.springboot.Exceptions.ResourceNotFoundException;
import com.group3s2i.springboot.Model.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class SupplierController {
    @Autowired
    SupplierRepository supplierRepository;

    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/supplier")
    public Supplier createSupplier(@RequestBody Supplier supplier){
        return supplierRepository.save (supplier);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplier")
    public List<Supplier> getAllSupplier() {
        System.out.println("Get all Suppliers...");

        return new ArrayList<> (supplierRepository.findAll ());
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplier/{id}")
    public ResponseEntity<Supplier> getSupplierById(@PathVariable(value = "id") Long id)
            throws ResourceNotFoundException {
        Supplier supplier = supplierRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Supplier not found for this id :: " + id));
        return ResponseEntity.ok().body(supplier);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/supplier/{id}")
    public Map<String, Boolean> deleteSupplier(@PathVariable(value = "id") Long id)
            throws ResourceNotFoundException {
        Supplier supplier = supplierRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Supplier not found  id :: " + id));

        supplierRepository.delete(supplier);
        Map<String, Boolean> response = new HashMap<> ();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/supplier/delete")
    public ResponseEntity<String> deleteAllSupplier() {
        System.out.println("Delete All Supplier...");

        supplierRepository.deleteAll();

        return new ResponseEntity<>("All Supplier have been deleted!", HttpStatus.OK);
    }



    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/supplier/{id}")
    public ResponseEntity<Supplier> updateSupplier(@PathVariable("id") long id, @RequestBody Supplier organization) {
        System.out.println("Update Supplier with ID = " + id + "...");

        Optional<Supplier> optionalSupplier = supplierRepository.findById(id);

        if (optionalSupplier.isPresent()) {
            Supplier supplier = optionalSupplier.get();
            supplier.setName (organization.getName ());
            supplier.setFiscalCode (organization.getFiscalCode ());
            supplier.setPatentcode (organization.getPatentcode ());
            supplier.setLegalStatus (organization.getLegalStatus ());
            supplier.setFinality (organization.getFinality ());
            supplier.setSize (organization.getSize ());
            supplier.setSector (organization.getSector ());
            supplier.setScope (organization.getScope ());

            return new ResponseEntity<>(supplierRepository.save(organization), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/supplier/count")
    public Long countsupplier(){
        return supplierRepository.count ();
    }
}
