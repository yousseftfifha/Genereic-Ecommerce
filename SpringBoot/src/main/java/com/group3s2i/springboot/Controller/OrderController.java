package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.*;
import com.group3s2i.springboot.Model.*;
import com.group3s2i.springboot.Service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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
    @Autowired
    private SuppliesRepository suppliesRepository;
    @Autowired
    private MouvementRepository mouvementRepository;
    @Autowired
    private ProductRepository productRepository;
    private final MailService mailService;

    public OrderController(MailService mailService) {
        this.mailService = mailService;
    }

    @PostMapping("/order")
    public ResponseEntity<Order> createCart(@RequestBody User user){
        Order order =new Order ();
        List<Cart> cartList=cartRepository.findAll ();
        List<OrderItem> orderItems=new ArrayList<> ();
        double totalCost = 0;
        for (Cart cart:cartList) {
            OrderItem orderItem = new OrderItem ();
            orderItem.setCreatedDate (LocalDateTime.now ());
            orderItem.setQuantity (cart.getQuantity ());
            orderItem.setProduct (cart.getProduct ());
            Mouvement mouvement=new Mouvement();
            List<Mouvement> mouvement1=mouvementRepository.findAllByProductOrderByIdAsc (cart.getProduct ());
            Mouvement mouvement2=mouvement1.stream()
                    .reduce((first, second) -> second).get();
            mouvement.setType (1);
            mouvement.setProduct (cart.getProduct ());
            mouvement.setQuantity (mouvement2.getQuantity ()- cart.getQuantity ());
            mouvement.setUpdatedat (LocalDateTime.now ());
            mouvementRepository.save (mouvement);
            orderItems.add (orderItem);
        }
        order.setStatus ("PENDING");
        order.setOrderItems (orderItems);
        order.setCreatedDate (LocalDateTime.now ());
        order.setUser (user);
        orderRepository.save (order);
        for (OrderItem orderItem1:orderItems){
            orderItem1.setOrder (order);
        }
        System.out.println (orderItems);
        orderItemsRepository.saveAllAndFlush (orderItems);
        String message= "Dear  "+user.getUsername ()+"\n you are receiving this mail because " +
                "your order have been Successful and soon you will Receive your package" +
                "\n Username:"+user.getUsername ()+
                "\n Order Date:"+order.getCreatedDate ()+
                "\n Order N°:"+order.getId ()+"\n Order Status:"+order.getStatus ()+
                "\n Have a Great Day."
                ;
        ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
        emailExecutor.execute(() -> mailService.sendEmail ("youssef.tfifha@esprit.tn","Welcome To 3s2i E-Shop",message));
        emailExecutor.shutdown();

        cartRepository.deleteAll();
        return   ResponseEntity.ok(order);
    }
    @GetMapping("/order/{user}")
    public List<Order> getAllOrders(@PathVariable User user){
        return orderRepository.findAllByUserOrderByCreatedDateDesc (user);
    }
    @GetMapping("/order/item/{id}")
    public List<OrderItem> getAllOrderItems(@PathVariable long id){
        Optional<Order> order=orderRepository.findById (id);
        return orderItemsRepository.findAllByOrderOrderByCreatedDateDesc (order);
    }


}
