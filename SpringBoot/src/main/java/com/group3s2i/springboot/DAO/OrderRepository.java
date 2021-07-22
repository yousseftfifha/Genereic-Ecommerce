package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Order;
import com.group3s2i.springboot.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository  extends JpaRepository<Order, Long> {
    @Query("select o from Order o where o.user = ?1 order by o.createdDate DESC")
    List<Order> findAllByUserOrderByCreatedDateDesc(User user);
}
