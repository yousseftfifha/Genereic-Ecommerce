package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@Table(name = "supplies")
public class Supplies implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "currency", nullable = false)
    private String currency;

    @Column(name = "unitprice", nullable = false)
    private Double unitprice;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Column(name = "delivery_date", nullable = false)
    private LocalDateTime deliveryDate;

    @Column(name = "delivery_type", nullable = false)
    private String deliveryType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="supplier", referencedColumnName = "id")
    @JsonBackReference
    private Supplier supplier;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "supplies")
    @JsonIgnoreProperties("supplies")
    private Product product;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "supplies")
    @JsonIgnoreProperties("supplies")
    private ProductPrice productPrice;

    public Supplies() {
    }

    public Supplies(Long id, String currency, Double unitprice, Supplier supplier) {
        this.id = id;
        this.currency = currency;
        this.unitprice = unitprice;
        this.supplier = supplier;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double price) {
        this.unitprice = price;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
}
