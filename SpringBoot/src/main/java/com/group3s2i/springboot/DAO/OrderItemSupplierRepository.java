package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderItemSupplier;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tfifha youssef
 */
public interface OrderItemSupplierRepository extends JpaRepository<OrderItemSupplier,Long> {
}
