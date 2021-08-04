package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliverySupplierItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliverySupplierItemRepository extends JpaRepository<DeliverySupplierItem, Long> {
}