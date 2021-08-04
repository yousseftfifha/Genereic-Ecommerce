package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliveryCustomer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryCustomerRepository extends JpaRepository<DeliveryCustomer, Long> {
}