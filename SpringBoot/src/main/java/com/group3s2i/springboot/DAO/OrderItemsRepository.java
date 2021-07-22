package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemsRepository extends JpaRepository<OrderItem,Long> {
}
