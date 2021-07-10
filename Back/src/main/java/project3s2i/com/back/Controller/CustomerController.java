package project3s2i.com.back.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import project3s2i.com.back.DAO.CustomerRepository;
import project3s2i.com.back.Exceptions.ResourceNotFoundException;
import project3s2i.com.back.Model.Customer;

import java.util.*;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class CustomerController {
    @Autowired
    CustomerRepository customerRepository;

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/Customers")
    public List<Customer> getAllCustomers() {
        System.out.println("Get all customers...");

        return new ArrayList<> (customerRepository.findAll ());
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/Customers/{id}")
    public ResponseEntity<Customer> getCustomerById(@PathVariable(value = "id") Long UtilisateurId)
            throws ResourceNotFoundException {
        Customer customer = customerRepository.findById(UtilisateurId)
                .orElseThrow(() -> new ResourceNotFoundException("customer not found for this id :: " + UtilisateurId));
        return ResponseEntity.ok().body(customer);
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/users/{username}")
    public ResponseEntity<Customer> getCustomerByID(@PathVariable String username){
        Customer customer = customerRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException ("Customer Not Found with username: " + username));

        return ResponseEntity.ok (customer);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/Customers/{id}")
    public Map<String, Boolean> deleteCustomer(@PathVariable(value = "id") Long UtilisateurId)
            throws ResourceNotFoundException {
        Customer customer = customerRepository.findById(UtilisateurId)
                .orElseThrow(() -> new ResourceNotFoundException("customer not found  id :: " + UtilisateurId));

        customerRepository.delete(customer);
        Map<String, Boolean> response = new HashMap<> ();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/Customers/delete")
    public ResponseEntity<String> deleteAllCustomer() {
        System.out.println("Delete All Customers...");

        customerRepository.deleteAll();

        return new ResponseEntity<>("All Customers have been deleted!", HttpStatus.OK);
    }



    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/Customers/{id}")
    public ResponseEntity<Customer> updateCustomer(@PathVariable("id") long id, @RequestBody Customer customer) {
        System.out.println("Update Customer with ID = " + id + "...");

        Optional<Customer> CustomerInfo = customerRepository.findById(id);

        if (CustomerInfo.isPresent()) {
            Customer utilisateur = CustomerInfo.get();
            utilisateur.setEmail(customer.getEmail());
            utilisateur.setUsername(customer.getUsername());
            utilisateur.setPassword(customer.getPassword());
            return new ResponseEntity<>(customerRepository.save(customer), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
