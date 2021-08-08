package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderSupplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author tfifha youssef
 */
public interface OrderSupplierRepository extends JpaRepository<OrderSupplier,Long> {
    @Query("select o from OrderSupplier o order by o.orderDate desc ")
    List<OrderSupplier> findAllOrderByOrderDate();
}
