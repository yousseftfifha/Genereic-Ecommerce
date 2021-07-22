package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.CartRepository;
import com.group3s2i.springboot.DAO.OrderItemsRepository;
import com.group3s2i.springboot.DAO.OrderRepository;
import com.group3s2i.springboot.Model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderItemsRepository orderItemsRepository;
    @Autowired
    private CartRepository cartRepository;
    
}
