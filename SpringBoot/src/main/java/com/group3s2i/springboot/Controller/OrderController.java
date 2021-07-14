package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.DAO.OrderRepository;
import com.group3s2i.springboot.Model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api/v1")

public class OrderController {

    @Autowired
    OrderRepository orderRepository;

    // get all orders
    @GetMapping("/order")
    public List<Order> getAllOrders(){
        return orderRepository.findAll();
    }

    // get order rest api
    @GetMapping("/order/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable long id){
        Order order = orderRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("order does not exist with id :"+ id));
        return   ResponseEntity.ok(order);
    }

    //create order rest api
    @PostMapping("/order")
    public Order createOrder(@RequestBody Order order){
        return orderRepository.save (order);
    }

    //update order rest api

    @PutMapping("/order/{id}/")
    public ResponseEntity<Order> updateOrder(@PathVariable("id") long id, @RequestBody Order order) {
        System.out.println("Update Order with ID = " + id + "...");

        Optional<Order> optionalOrder = orderRepository.findById(id);

        if (optionalOrder.isPresent()) {
            Order order1 = optionalOrder.get();

            order1.setDueamount(order.getDueamount());
            order1.setInnoNumber(order.getInnoNumber());
            order1.setDate(order.getDate());
            order1.setStatus(order.getStatus());
            order1.setOrderNum(order.getOrderNum());
            order1.setUserID(order.getUserID());


            return new ResponseEntity<>(orderRepository.save(order), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    //delete order rest api

    @DeleteMapping("/order/{id}")
    public Map<String, Boolean> deleteOrder(@PathVariable(value = "id") Long id)
            throws com.group3s2i.springboot.Exceptions.ResourceNotFoundException {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new com.group3s2i.springboot.Exceptions.ResourceNotFoundException("Order not found  id :: " + id));

        orderRepository.delete(order);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

}
