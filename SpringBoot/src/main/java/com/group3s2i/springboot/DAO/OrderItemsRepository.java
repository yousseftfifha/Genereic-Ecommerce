package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Order;
import com.group3s2i.springboot.Model.OrderItem;
import com.group3s2i.springboot.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OrderItemsRepository extends JpaRepository<OrderItem,Long> {
    @Query("select o from OrderItem o where o.order = ?1 order by o.createdDate DESC")
    List<OrderItem> findAllByOrderOrderByCreatedDateDesc(Optional<Order> order);

}
