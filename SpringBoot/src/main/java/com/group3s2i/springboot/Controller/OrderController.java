package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.*;
import com.group3s2i.springboot.Model.*;
import com.group3s2i.springboot.Service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class OrderController {
    @Autowired
    private OrderCustomerRepository orderCustomerRepository;
    @Autowired
    private OrderCustomerItemRepository orderCustomerItemRepository;
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private MouvementRepository mouvementRepository;
    @Autowired
    private ProductRepository productRepository;
    private final MailService mailService;

    public OrderController(MailService mailService) {
        this.mailService = mailService;
    }

 @PostMapping("/order")
    public ResponseEntity<OrderCustomer> createCart(@RequestBody Customer user){
        OrderCustomer orderCustomer =new OrderCustomer ();
        List<Cart> cartList=cartRepository.findAll ();
        List<OrderCustomerItem> orderCustomerItems =new ArrayList<> ();
        double totalCost = 0;
     int i=0;

     for (Cart cart:cartList) {
            OrderCustomerItem orderCustomerItem = new OrderCustomerItem ();
            orderCustomerItem.setCreatedDate (LocalDateTime.now ());
            orderCustomerItem.setQuantity (cart.getQuantity ());
            orderCustomerItem.setProduct (cart.getProduct ());
            orderCustomerItem.setItemSeq (i);
            orderCustomerItem.setDiscountCode (0.0);
            orderCustomerItem.setVatCode (19.0);
            Mouvement mouvement=new Mouvement();
            List<Mouvement> mouvement1=mouvementRepository.findAllByProductOrderByIdAsc (cart.getProduct ());
            Mouvement mouvement2=mouvement1.stream()
                    .reduce((first, second) -> second).get();
            mouvement.setTypeMouvement ("OUT");
            mouvement.setProduct (cart.getProduct ());
            mouvement.setQuantity (cart.getQuantity ());
            mouvement.setMouvementDate (LocalDateTime.now ());
            mouvement.setUnitPrice (mouvement2.getUnitPrice ());

            mouvementRepository.save (mouvement);
            orderCustomerItems.add (orderCustomerItem);
            i++;
        }
        orderCustomer.setStatus ("PENDING");
        orderCustomer.setOrderCustomerItems (orderCustomerItems);
        orderCustomer.setCreatedDate (LocalDateTime.now ());
        orderCustomer.setCustomer (user);
        orderCustomer.setSentMedia ("INTRANET");
        orderCustomer.setUrgent ("NORMALE");
     Random random = new Random();

     orderCustomer.setOrderNumber (String.valueOf (random.nextInt(100000 - 1)+1));
     orderCustomerRepository.save (orderCustomer);
        for (OrderCustomerItem orderCustomerItem1 : orderCustomerItems){
            orderCustomerItem1.setOrderCustomer (orderCustomer);
        }
        orderCustomerItemRepository.saveAllAndFlush (orderCustomerItems);
        String message= "Dear  "+user.getFirstName ()+" "+user.getLastName ()+"\n you are receiving this mail because " +
                "your order have been Successful and soon you will Receive your package" +
                "\n Order Date:"+ orderCustomer.getCreatedDate ()+
                "\n Order N°:"+ orderCustomer.getId ()+"\n Order Status:"+ orderCustomer.getStatus ()+
                "\n Have a Great Day."
                ;
        ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
        emailExecutor.execute(() -> mailService.sendEmail ("youssef.tfifha@esprit.tn","Welcome To 3s2i E-Shop",message));
        emailExecutor.shutdown();

        cartRepository.deleteAll();
        return   ResponseEntity.ok(orderCustomer);
    }
    @GetMapping("/order")
    public List<OrderCustomer> getOrders(){
        return orderCustomerRepository.findAllOrderByOrderDate();
    }
    @GetMapping("/order/{customer}")
    public List<OrderCustomer> getAllOrders(@PathVariable Customer customer){
        return orderCustomerRepository.findAllByUserOrderByCreatedDateDesc (customer);
    }
    @GetMapping("/order/item/{id}")
    public List<OrderCustomerItem> getAllOrderItems(@PathVariable long id){
        Optional<OrderCustomer> order= orderCustomerRepository.findById (id);
        return orderCustomerItemRepository.findAllByOrderOrderByCreatedDateDesc (order);
    }
    @PutMapping("/order/{id}/{status}")
    public ResponseEntity<OrderCustomer> ConfirmOrderCustomer(@PathVariable("id") long id,@PathVariable("status") String status) {

        Optional<OrderCustomer> optionalOrderCustomer = orderCustomerRepository.findById(id);

        if (optionalOrderCustomer.isPresent()) {
            OrderCustomer orderCustomer1 = optionalOrderCustomer.get();
            orderCustomer1.setStatus (status);

            return new ResponseEntity<>(orderCustomerRepository.save(orderCustomer1), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/order/count")
    public Long count(){
        return orderCustomerRepository.count ();
    }

  @GetMapping("/order/count1")
    public Long countmouvement(){
        return mouvementRepository.count ();
    }
    @GetMapping("/order/count2")
    public Long countmouvementIN(){
        return mouvementRepository.countAllByTypeMouvementEqualsIN ();
    }
    @GetMapping("/order/count3")
    public Long countmouvementOUT(){
        return mouvementRepository.countAllByTypeMouvementEqualsOUT ();
    }

    @GetMapping("/order/earning")
    public Double earning(){
        return mouvementRepository.earning ();
    }
}
