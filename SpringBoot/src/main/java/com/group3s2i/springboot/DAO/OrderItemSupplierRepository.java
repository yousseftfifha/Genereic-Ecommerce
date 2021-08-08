package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderCustomer;
import com.group3s2i.springboot.Model.OrderCustomerItem;
import com.group3s2i.springboot.Model.OrderItemSupplier;
import com.group3s2i.springboot.Model.OrderSupplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

/**
 * @author tfifha youssef
 */
public interface OrderItemSupplierRepository extends JpaRepository<OrderItemSupplier,Long> {
    @Query("select o from OrderItemSupplier o where o.orderSupplier = ?1 ")
    List<OrderItemSupplier> findAllByOrderSupplier(Optional<OrderSupplier> order);

}
