package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.CartRepository;
import com.group3s2i.springboot.DAO.OrderItemsRepository;
import com.group3s2i.springboot.DAO.OrderRepository;
import com.group3s2i.springboot.Model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderItemsRepository orderItemsRepository;
    @Autowired
    private CartRepository cartRepository;
    @PostMapping("/order")
    public ResponseEntity<Order> createCart(@RequestBody User user){
        Order order =new Order ();
        List<Cart> cartList=cartRepository.findAll ();
        List<OrderItem> orderItems=new ArrayList<> ();
        double totalCost = 0;
        for (Cart cart:cartList) {
            OrderItem orderItem=new OrderItem ();
            orderItem.setCreatedDate (LocalDate.now());
            orderItem.setQuantity (cart.getQuantity ());
            orderItem.setProduct (cart.getProduct ());
            orderItems.add (orderItem);
            totalCost += (cart.getProduct().getMouvement ().getUnit_price ()* cart.getQuantity());
        }
        order.setTotalPrice (totalCost);
        order.setStatus ("PENDING");
        order.setOrderItems (orderItems);
        order.setUser (user);
        orderRepository.save (order);
        for (OrderItem orderItem1:orderItems){
            orderItem1.setOrder (order);
        }
        System.out.println (orderItems);
        orderItemsRepository.saveAllAndFlush (orderItems);
        cartRepository.deleteAll();
        return   ResponseEntity.ok(order);
    }
    // get all cart
    @GetMapping("/order")
    public List<Order> getAllOrders(){
        return orderRepository.findAll();
    }


}
