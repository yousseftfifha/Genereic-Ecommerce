package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetailsRepository extends JpaRepository<OrderDetails,Long> {
}
