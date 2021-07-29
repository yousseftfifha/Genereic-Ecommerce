package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Entity
@Table(name = "delivery_order_item")
public class DeliveryOrderItem {

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "quantity_ordered")
    private int quantityOrdered;

    @Column(name = "quantity_invoiced")
    private int quantityInvoiced;

    @Column(name = "quantity_shipped")
    private int quantityShipped;

    @Column(name = "discount_amount")
    private int discountAmount;

    @Column(name = "note")
    private String note;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="order_delivery_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @JsonBackReference
    private DeliveryOrder deliveryOrder;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private ProductSupplier productSupplier;

    public DeliveryOrderItem() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getQuantityOrdered() {
        return quantityOrdered;
    }

    public void setQuantityOrdered(int quantityOrdered) {
        this.quantityOrdered = quantityOrdered;
    }

    public int getQuantityInvoiced() {
        return quantityInvoiced;
    }

    public void setQuantityInvoiced(int quantityInvoiced) {
        this.quantityInvoiced = quantityInvoiced;
    }

    public int getQuantityShipped() {
        return quantityShipped;
    }

    public void setQuantityShipped(int quantityShipped) {
        this.quantityShipped = quantityShipped;
    }



    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }


    public ProductSupplier getProductSupplier() {
        return productSupplier;
    }

    public void setProductSupplier(ProductSupplier productSupplier) {
        this.productSupplier = productSupplier;
    }
}
