package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliverySupplier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliverySupplierRepository extends JpaRepository<DeliverySupplier, Long> {
}