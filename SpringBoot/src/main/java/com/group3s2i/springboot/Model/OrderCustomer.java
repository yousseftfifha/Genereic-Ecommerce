package com.group3s2i.springboot.Model;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Table(name="orders_customer")
public class OrderCustomer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_number")
    private String orderNumber;

    @Column(name = "status")
    private String status;

    @Column(name = "sent_media")
    private String sentMedia;

    @Column(name = "urgent")
    private String urgent;

    @Column(name = "created_date")
    private LocalDateTime createdDate;


    @OneToMany(
            mappedBy = "orderCustomer",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonIgnoreProperties
    @ToString.Exclude
    @JsonManagedReference(value = "m-d")
    private List<OrderCustomerItem> orderCustomerItems;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="customer_id", referencedColumnName = "id")
    @JsonBackReference(value = "o-s")
    @ToString.Exclude
    private Customer customer;

    public OrderCustomer() {
    }


}
