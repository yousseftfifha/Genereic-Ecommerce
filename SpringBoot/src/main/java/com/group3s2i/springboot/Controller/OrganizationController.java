package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.OrganizationRepository;
import com.group3s2i.springboot.Exceptions.ResourceNotFoundException;
import com.group3s2i.springboot.Model.Organization;
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
public class OrganizationController {
    @Autowired
    OrganizationRepository organizationRepository;

    @CrossOrigin(origins = "http://localhost:4200")
    @PostMapping("/organization")
    public Organization createOrganization(@RequestBody Organization organization){
        return organizationRepository.save (organization);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/organization")
    public List<Organization> getAllOrganization() {
        System.out.println("Get all Organization...");

        return new ArrayList<> (organizationRepository.findAll ());
    }
    @CrossOrigin(origins = "http://localhost:4200")
    @GetMapping("/organization/{id}")
    public ResponseEntity<Organization> getOrganizationById(@PathVariable(value = "id") Long id)
            throws ResourceNotFoundException {
        Organization organization = organizationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Organization not found for this id :: " + id));
        return ResponseEntity.ok().body(organization);
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/organization/{id}")
    public Map<String, Boolean> deleteOrganization(@PathVariable(value = "id") Long id)
            throws ResourceNotFoundException {
        Organization organization = organizationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Organization not found  id :: " + id));

        organizationRepository.delete(organization);
        Map<String, Boolean> response = new HashMap<> ();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

    @CrossOrigin(origins = "http://localhost:4200")
    @DeleteMapping("/organization/delete")
    public ResponseEntity<String> deleteAllOrganization() {
        System.out.println("Delete All Organization...");

        organizationRepository.deleteAll();

        return new ResponseEntity<>("All Organization have been deleted!", HttpStatus.OK);
    }



    @CrossOrigin(origins = "http://localhost:4200")
    @PutMapping("/organization/{id}")
    public ResponseEntity<Organization> updateOrganization(@PathVariable("id") long id, @RequestBody Organization organization) {
        System.out.println("Update Organization with ID = " + id + "...");

        Optional<Organization> optionalOrganization = organizationRepository.findById(id);

        if (optionalOrganization.isPresent()) {
            Organization organization1 = optionalOrganization.get();
            organization1.setName (organization.getName ());
            organization1.setFiscalCode (organization.getFiscalCode ());
            organization1.setPatentcode (organization.getPatentcode ());
            organization1.setLegalStatus (organization.getLegalStatus ());
            organization1.setFinality (organization.getFinality ());
            organization1.setSize (organization.getSize ());
            organization1.setSector (organization.getSector ());
            organization1.setScope (organization.getScope ());

            return new ResponseEntity<>(organizationRepository.save(organization), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
