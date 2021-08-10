package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Customer;
import com.group3s2i.springboot.Model.OrderCustomer;
import com.group3s2i.springboot.Model.OrderSupplier;
import com.group3s2i.springboot.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderCustomerRepository extends JpaRepository<OrderCustomer, Long> {
    @Query("select o from OrderCustomer o where o.customer = ?1 order by o.createdDate DESC")
    List<OrderCustomer> findAllByUserOrderByCreatedDateDesc(Customer customer);

    @Query("select o from OrderCustomer o order by o.createdDate desc ")
    List<OrderCustomer> findAllOrderByOrderDate();


}
