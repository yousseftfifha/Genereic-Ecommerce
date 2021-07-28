package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderSupplier;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tfifha youssef
 */
public interface OrderSupplierRepository extends JpaRepository<OrderSupplier,Long> {
}
