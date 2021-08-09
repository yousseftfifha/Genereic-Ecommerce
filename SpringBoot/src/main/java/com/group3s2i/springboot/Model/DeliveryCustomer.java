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

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "delivery_customer")
public class DeliveryCustomer implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "delivery_date")
    private LocalDateTime DeliveryDate;

    @Column(name = "delivery_number")
    private String DeliveryNumber;

    @OneToMany(
            mappedBy = "deliveryCustomer",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @ToString.Exclude
    @JsonManagedReference(value = "customer_delivery")
    private List<DeliveryCustomerItem> deliveryCustomerItems;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name="customer_id", referencedColumnName = "id")
    @JsonBackReference(value = "caa")
    @ToString.Exclude
    private Customer customer;

    public DeliveryCustomer() {
    }

}
