package com.group3s2i.springboot.Controller;

import com.group3s2i.springboot.DAO.*;
import com.group3s2i.springboot.Model.*;
import com.group3s2i.springboot.Service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class OrderSupplierController {
    @Autowired
    private OrderSupplierRepository orderSupplierRepository;
    @Autowired
    private OrderItemSupplierRepository orderItemSupplierRepository;

    @Autowired
    private MouvementRepository mouvementRepository;
    @Autowired
    private ProductRepository productRepository;

 @PostMapping("/ordersupplier")
    public ResponseEntity<OrderSupplier> createOS(@RequestBody List<Product> products){
     OrderSupplier orderSupplier =new OrderSupplier ();
     List<OrderItemSupplier> orderItemSuppliers =new ArrayList<> ();
        int i=0;
     for (Product product:products){
         OrderItemSupplier orderItemSupplier=new OrderItemSupplier ();
         orderItemSupplier.setItemSeq (i);
         orderItemSupplier.setQuantity (10);
         orderItemSupplier.setProduct (product);

            Mouvement mouvement=new Mouvement();
            List<Mouvement> mouvement1=mouvementRepository.findAllByProductOrderByIdAsc (product);
            Mouvement mouvement2=mouvement1.stream()
                    .reduce((first, second) -> second).get();
            mouvement.setTypeMouvement ("IN");
            mouvement.setProduct (product);
            mouvement.setQuantity (10);
            mouvement.setMouvementDate (LocalDateTime.now ());
            mouvement.setUnitPrice (mouvement2.getUnitPrice ());

            mouvementRepository.save (mouvement);
            orderItemSuppliers.add (orderItemSupplier);

         i++;



     }
         orderSupplier.setStatus ("PENDING");
     orderSupplier.setOrderItemSuppliers (orderItemSuppliers);
     orderSupplier.setOrderDate (LocalDateTime.now ());
     Random random = new Random();

     orderSupplier.setOrderNumber (String.valueOf (random.nextInt(100000 - 1)+1));
     orderSupplierRepository.save (orderSupplier);
        for (OrderItemSupplier orderItemSupplier : orderItemSuppliers){
            orderItemSupplier.setOrderSupplier (orderSupplier);
        }
        orderItemSupplierRepository.saveAllAndFlush (orderItemSuppliers);
        return   ResponseEntity.ok(orderSupplier);
    }
    @GetMapping("/ordersupplier")
    public List<OrderSupplier> getOrders(){
        return orderSupplierRepository.findAllOrderByOrderDate();
    }

    @GetMapping("/ordersupplier/item/{id}")
    public List<OrderItemSupplier> getAllOrderItems(@PathVariable long id){
        Optional<OrderSupplier> order= orderSupplierRepository.findById (id);
        return orderItemSupplierRepository.findAllByOrderSupplier (order);
    }
    @PutMapping("/ordersupplier/{id}/{status}")
    public ResponseEntity<OrderSupplier> ConfirmOrderSupplier(@PathVariable("id") long id,@PathVariable("status") String status) {

        Optional<OrderSupplier> optionalOrderCustomer = orderSupplierRepository.findById(id);

        if (optionalOrderCustomer.isPresent()) {
            OrderSupplier orderCustomer1 = optionalOrderCustomer.get();
            orderCustomer1.setStatus (status);

            return new ResponseEntity<>(orderSupplierRepository.save(orderCustomer1), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
//    @PutMapping("/order/{id}/{status}")
//    public ResponseEntity<OrderCustomer> ConfirmOrderCustomer(@PathVariable("id") long id,@PathVariable("status") String status) {
//
//        Optional<OrderCustomer> optionalOrderCustomer = orderCustomerRepository.findById(id);
//
//        if (optionalOrderCustomer.isPresent()) {
//            OrderCustomer orderCustomer1 = optionalOrderCustomer.get();
//            orderCustomer1.setStatus (status);
//
//            return new ResponseEntity<>(orderCustomerRepository.save(orderCustomer1), HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }

}
