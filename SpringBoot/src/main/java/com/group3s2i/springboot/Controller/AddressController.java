package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.AddressCustomerRepository;
import com.group3s2i.springboot.DAO.CustomerRepository;
import com.group3s2i.springboot.Model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author tfifha youssef
 */
@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class AddressController {
    @Autowired
    private AddressCustomerRepository addressCustomerRepository;
    @Autowired
    private CustomerRepository customerRepository;
//    @GetMapping("/address")
//    public ResponseEntity<List<Address>> getAddress () {
//        List<Address> cars = addressRepository.findAll ();
//        return new ResponseEntity<>(cars, HttpStatus.OK);
//    }
    @GetMapping("/address/{id}")
    public List<Address> getAllAddressByUserId(@PathVariable(value = "id") Long id) {
        return addressCustomerRepository.findByCustomerId (id);
    }
//    @PostMapping("/address/{id}")
//    public Address createAddress( @PathVariable(value = "id") long id,@Valid @RequestBody  Address address){
//        return customerRepository.findById(id).map(customer -> {
//            address.setCustomer (customer);
//            address.setType ("DOMICILE");
//            return addressRepository.save(address);
//        }).orElseThrow(() -> new ResourceNotFoundException ("customer " + id + " not found"));
//    }
//    @PutMapping("/address/{usersId}/{addressID}")
//    public Address updateComment(@PathVariable (value = "usersId") Long usersId,
//                             @PathVariable (value = "addressID") Long addressID) {
//        if(!customerRepository.existsById(usersId)) {
//            throw new ResourceNotFoundException ("UserID " + usersId + " not found");
//        }
//
//        return addressRepository.findById(addressID).map(address -> {
//            address.setType ("Delivery");
//            return addressRepository.save(address);
//        }).orElseThrow(() -> new ResourceNotFoundException("addressID " + addressID + "not found"));
//    }
}
