package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Productinformation;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductinformationRepository extends JpaRepository<Productinformation, Long> {

}