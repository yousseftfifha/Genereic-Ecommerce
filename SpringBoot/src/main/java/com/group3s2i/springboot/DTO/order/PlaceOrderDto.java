package com.group3s2i.springboot.DTO.order;


import com.group3s2i.springboot.Model.Order;
import com.group3s2i.springboot.Model.User;

import javax.validation.constraints.NotNull;

public class PlaceOrderDto {
    private Long id;
    private @NotNull User user;
    private @NotNull Double totalPrice;

    public PlaceOrderDto() {
    }

    public PlaceOrderDto(Order order) {
        this.setId(order.getId());
        this.setUser(order.getUser());
        this.setTotalPrice(order.getTotalPrice());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
