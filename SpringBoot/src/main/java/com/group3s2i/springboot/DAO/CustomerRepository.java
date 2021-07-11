package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.Optional;

@RepositoryRestResource
@CrossOrigin("*")
public interface CustomerRepository extends JpaRepository<Customer, Long> {



}
