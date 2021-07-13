package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Productdetails;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductdetailsRepository extends JpaRepository<Productdetails, Long> {

}