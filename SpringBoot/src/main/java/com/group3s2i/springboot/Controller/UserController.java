package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.UserRepository;
import com.group3s2i.springboot.Exceptions.ResourceNotFoundException;
import com.group3s2i.springboot.Model.User;
import com.group3s2i.springboot.Service.UserService;
import com.sun.security.auth.UserPrincipal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;


import java.security.Principal;
import java.util.*;

/**
 * @author tfifha youssef
 */
@RestController
@RequestMapping("/api")
public class UserController {
    @Autowired
    UserRepository userRepository;
    private  final UserService userService;
    @Autowired
    PasswordEncoder encoder;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/Users")
    public List<User> getAllUser() {
        System.out.println("Get all User...");

        return new ArrayList<> (userRepository.findAll ());
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/Users/id/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) throws ResourceNotFoundException {
        User user=userRepository.findById (id).orElseThrow (
                ()->new ResourceNotFoundException ("Employee not ext with id :"+id)
        );
        return ResponseEntity.ok (user);
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/Users/username/{username}")
    public ResponseEntity<User> getUserByUsername(@PathVariable String username){
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException ("User Not Found with username: " + username));

        return ResponseEntity.ok (user);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/Users/{username}")
    public Map<String, Boolean> deleteUser(@PathVariable(value = "username") String username)
            throws ResourceNotFoundException {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new ResourceNotFoundException("user not found  username :: " + username));

        userRepository.delete(user);
        Map<String, Boolean> response = new HashMap<> ();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/Users/delete")
    public ResponseEntity<String> deleteAllUser() {
        System.out.println("Delete All User...");

        userRepository.deleteAll();

        return new ResponseEntity<>("All User have been deleted!", HttpStatus.OK);
    }



    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/Users/{username}")
    public ResponseEntity<User> updateCustomer(@PathVariable(value = "username") String username, @RequestBody User user) {
        System.out.println("Update User with ID = " + username + "...");

        Optional<User> userOptional = userRepository.findByUsername (username);

        if (userOptional.isPresent()) {
            User utilisateur = userOptional.get();
            utilisateur.setUsername (user.getUsername ());
            utilisateur.setEmail (user.getEmail ());
            utilisateur.getCustomer ().setFirstName (user.getCustomer ().getFirstName ());
            utilisateur.getCustomer ().setLastName (user.getCustomer ().getLastName ());
            utilisateur.getCustomer ().setPhoneNumber (user.getCustomer ().getPhoneNumber ());
            utilisateur.getCustomer ().setUrl (user.getCustomer ().getUrl ());
            return new ResponseEntity<>(userRepository.save(user), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

}
