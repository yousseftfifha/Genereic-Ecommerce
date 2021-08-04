package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderCustomer;
import com.group3s2i.springboot.Model.OrderCustomerItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OrderCustomerItemRepository extends JpaRepository<OrderCustomerItem,Long> {
    @Query("select o from OrderCustomerItem o where o.orderCustomer = ?1 order by o.createdDate DESC")
    List<OrderCustomerItem> findAllByOrderOrderByCreatedDateDesc(Optional<OrderCustomer> order);

}
