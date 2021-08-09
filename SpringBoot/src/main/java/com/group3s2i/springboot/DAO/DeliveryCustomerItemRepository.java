package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliveryCustomer;
import com.group3s2i.springboot.Model.DeliveryCustomerItem;
import com.group3s2i.springboot.Model.OrderItemSupplier;
import com.group3s2i.springboot.Model.OrderSupplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface DeliveryCustomerItemRepository extends JpaRepository<DeliveryCustomerItem, Long> {
    @Query("select d from DeliveryCustomerItem d where d.deliveryCustomer = ?1")
    List<DeliveryCustomerItem> findAllOrderByDeliveryCustomer(Optional<DeliveryCustomer> order);

}