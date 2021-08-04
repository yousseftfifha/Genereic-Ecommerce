package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliveryCustomerItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryCustomerItemRepository extends JpaRepository<DeliveryCustomerItem, Long> {
}