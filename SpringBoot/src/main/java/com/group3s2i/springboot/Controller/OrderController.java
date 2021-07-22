package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.Service.OrderService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

//
//
//    @PostMapping("/add")
//    public ResponseEntity<ApiResponse> placeOrder(@RequestParam("token") String token, @RequestParam("sessionId") String sessionId)
//            throws ProductNotExistException, AuthenticationFailException {
//        authenticationService.authenticate(token);
//        User user = authenticationService.getUser(token);
//        orderService.placeOrder(user, sessionId);
//        return new ResponseEntity<ApiResponse>(new ApiResponse(true, "Order has been placed"), HttpStatus.CREATED);
//    }
//
//    @GetMapping("/")
//    public ResponseEntity<List<Order>> getAllOrders(@RequestParam("token") String token) throws AuthenticationFailException {
//        authenticationService.authenticate(token);
//        User user = authenticationService.getUser(token);
//        List<Order> orderDtoList = orderService.listOrders(user);
//        return new ResponseEntity<List<Order>>(orderDtoList,HttpStatus.OK);
//    }
//
//    @PostMapping("/create-checkout-session")
//    public ResponseEntity<StripeResponse> checkoutList(@RequestBody List<CheckoutItemDto> checkoutItemDtoList) throws StripeException {
//        Session session = orderService.createSession(checkoutItemDtoList);
//        StripeResponse stripeResponse = new StripeResponse(session.getId());
//        return new ResponseEntity<StripeResponse>(stripeResponse,HttpStatus.OK);
//    }
//
//    @GetMapping("/{id}")
//    public ResponseEntity<Object> getAllOrders(@PathVariable("id") Integer id, @RequestParam("token") String token) throws AuthenticationFailException {
//        authenticationService.authenticate(token);
//        User user = authenticationService.getUser(token);
//        try {
//            Order order = orderService.getOrder(id);
//            return new ResponseEntity<>(order,HttpStatus.OK);
//        }
//        catch (OrderNotFoundException e) {
//            return new ResponseEntity<>(e.getMessage(),HttpStatus.NOT_FOUND);
//        }
//
//    }

}
