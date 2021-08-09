package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.DeliveryCustomer;
import com.group3s2i.springboot.Model.OrderSupplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DeliveryCustomerRepository extends JpaRepository<DeliveryCustomer, Long> {
    @Query("select d from DeliveryCustomer d order by d.DeliveryDate desc ")
    List<DeliveryCustomer> findAllOrderByDeliveryDate();
}