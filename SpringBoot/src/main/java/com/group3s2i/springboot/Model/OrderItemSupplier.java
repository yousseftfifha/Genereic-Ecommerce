package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * @author tfifha youssef
 */

@Entity
@Table(name = "orderitemsupplier")
public class OrderItemSupplier {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    @Column(name = "quantity")
    private @NotNull int quantity;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="order_supplier_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @JsonBackReference
    private OrderSupplier orderSupplier;

    @OneToOne
    @JoinColumn(name = "productsupplier_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private ProductSupplier productSupplier;

    public OrderItemSupplier() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public OrderSupplier getOrderSupplier() {
        return orderSupplier;
    }

    public void setOrderSupplier(OrderSupplier orderSupplier) {
        this.orderSupplier = orderSupplier;
    }

    public ProductSupplier getProductSupplier() {
        return productSupplier;
    }

    public void setProductSupplier(ProductSupplier productSupplier) {
        this.productSupplier = productSupplier;
    }
}
