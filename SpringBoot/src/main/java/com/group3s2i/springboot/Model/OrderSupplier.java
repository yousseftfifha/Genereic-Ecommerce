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
@Table(name="orders_supplier")
public class OrderSupplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_number")
    private String orderNumber;

    @Column(name = "status")
    private String status;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @Column(name = "canceled_date")
    private LocalDateTime cancelledDate;

    @Column(name = "order_date")
    private LocalDateTime orderDate;

    @Column(name = "sent_media")
    private String sentMedia;

    @Column(name = "urgent")
    private String urgent;

    @OneToMany(
            mappedBy = "orderSupplier",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonIgnoreProperties
    @ToString.Exclude
    private List<OrderItemSupplier> orderItemSuppliers;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supplier_id", referencedColumnName = "id")
    @JsonIgnoreProperties
    @ToString.Exclude
    private Supplier supplier;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "currency_id")
    @ToString.Exclude
    private Currency currency;

    public OrderSupplier() {
    }

}
