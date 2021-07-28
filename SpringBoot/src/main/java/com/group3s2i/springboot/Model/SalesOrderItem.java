package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Entity
@Table(name = "sales_order_item")
public class SalesOrderItem {

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

    @Column(name = "quantity_cancelled")
    private int quantityCancelled;

    @Column(name = "quantity_refunded")
    private int quantityRefunded;

    @Column(name = "quantity_returned")
    private int quantityReturned;

    @Column(name = "discount_amount")
    private int discountAmount;

    @Column(name = "note")
    private String note;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="order_supplier_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @JsonBackReference
    private OrderSupplier orderSupplier;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private ProductSupplier productSupplier;

    public SalesOrderItem() {
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

    public int getQuantityCancelled() {
        return quantityCancelled;
    }

    public void setQuantityCancelled(int quantityCancelled) {
        this.quantityCancelled = quantityCancelled;
    }

    public int getQuantityRefunded() {
        return quantityRefunded;
    }

    public void setQuantityRefunded(int quantityRefunded) {
        this.quantityRefunded = quantityRefunded;
    }

    public int getQuantityReturned() {
        return quantityReturned;
    }

    public void setQuantityReturned(int quantityReturned) {
        this.quantityReturned = quantityReturned;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
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
