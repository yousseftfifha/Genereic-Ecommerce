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

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "delivery_supplier_items")
public class DeliverySupplierItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "item_seq")
    private int itemSeq;

    @Column(name = "quantity_accepted")
    private int quantityAccepted;

    @Column(name = "quantity_shipped")
    private int quantityShipped;


    @Column(name = "note")
    private String note;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "delivery_id", referencedColumnName = "id")
    @ToString.Exclude
    @JsonBackReference(value = "supplier_delivery")
    private DeliverySupplier deliverySupplier;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name="order_item_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ToString.Exclude
    private OrderItemSupplier orderItemSupplier;
    public DeliverySupplierItem() {
    }
}
