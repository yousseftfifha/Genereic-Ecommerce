package com.group3s2i.springboot.Service;

import com.group3s2i.springboot.DAO.OrderRepository;
import com.group3s2i.springboot.DTO.checkout.CheckoutItemDto;
import com.group3s2i.springboot.DTO.order.PlaceOrderDto;
import com.group3s2i.springboot.Exceptions.ResourceNotFoundException;
import com.group3s2i.springboot.Model.Order;
import com.group3s2i.springboot.Model.User;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
@Transactional
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;


    @Autowired
    OrderItemsService orderItemsService;

    @Value("http://localhost:8081/")
    private String baseURL;

    @Value("${STRIPE_SECRET_KEY}")
    private String apiKey;

    public Order saveOrder(Order order){
        return orderRepository.save(order);
    }



    public List<Order> listOrders(User user) {
        return orderRepository.findAllByUserOrderByCreatedDateDesc(user);
    }

    public Order getOrder(Long orderId) throws ResourceNotFoundException {
        Optional<Order> order = orderRepository.findById(orderId);
        if (order.isPresent()) {
            return order.get();
        }
        throw new ResourceNotFoundException("Order not found");
    }


//    public void placeOrder(User user, String sessionId) {
//        CartDto cartDto = cartService.listCartItems(user);
//
//        PlaceOrderDto placeOrderDto = new PlaceOrderDto();
//        placeOrderDto.setUser(user);
//        placeOrderDto.setTotalPrice(cartDto.getTotalCost());
//
//        Order newOrder = saveOrder(placeOrderDto, user, sessionId);
//        List<CartItemDto> cartItemDtoList = cartDto.getcartItems();
//        for (CartItemDto cartItemDto : cartItemDtoList) {
//            OrderItem orderItem = new OrderItem(
//                    newOrder,
//                    cartItemDto.getProduct(),
//                    cartItemDto.getQuantity(),
//                    cartItemDto.getProduct().getPrice());
//            orderItemsService.addOrderedProducts(orderItem);
//        }
//        cartService.deleteUserCartItems(user);
//    }

    SessionCreateParams.LineItem.PriceData createPriceData(CheckoutItemDto checkoutItemDto) {
        return SessionCreateParams.LineItem.PriceData.builder()
                .setCurrency("usd")
                .setUnitAmount( ((long) checkoutItemDto.getPrice()) * 100)
                .setProductData(
                        SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                .setName(checkoutItemDto.getProductName())
                                .build())
                .build();
    }

    SessionCreateParams.LineItem createSessionLineItem(CheckoutItemDto checkoutItemDto) {
        return SessionCreateParams.LineItem.builder()
                .setPriceData(createPriceData(checkoutItemDto))
                .setQuantity(Long.parseLong(String.valueOf(checkoutItemDto.getQuantity())))
                .build();
    }

    public Session createSession(List<CheckoutItemDto> checkoutItemDtoList) throws StripeException {

        String successURL = baseURL + "payment/success";
        String failedURL = baseURL + "payment/failed";

        Stripe.apiKey = apiKey;

        List<SessionCreateParams.LineItem> sessionItemsList = new ArrayList<SessionCreateParams.LineItem>();
        for (CheckoutItemDto checkoutItemDto : checkoutItemDtoList) {
            sessionItemsList.add(createSessionLineItem(checkoutItemDto));
        }

        SessionCreateParams params = SessionCreateParams.builder()
                .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setCancelUrl(failedURL)
                .addAllLineItem(sessionItemsList)
                .setSuccessUrl(successURL)
                .build();
        return Session.create(params);
    }
}


