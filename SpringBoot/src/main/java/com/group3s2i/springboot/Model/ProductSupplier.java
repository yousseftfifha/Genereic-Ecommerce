package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "productsupplier")
public class ProductSupplier {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "brand")
    private String brand;

    @Column(name = "unit_price")
    private Double unitPrice;

    @Column(name = "tva")
    private Double tva;

    @Column(name = "margin_rate")
    private Double marginRate;

    @Column(name = "qty")
    private int qty;

    @Column(name = "currency")
    private String currency;

    @Column(name = "delivery_eta")
    private String deliveryETA;

//    @OneToMany(
//            mappedBy = "product",
//            cascade = CascadeType.ALL,
//            orphanRemoval = true
//    )
//    @JsonManagedReference
//    @ToString.Exclude
//    private List<Supplier> suppliers = new ArrayList<> ();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTva() {
        return tva;
    }

    public void setTva(Double tva) {
        this.tva = tva;
    }

    public Double getMarginRate() {
        return marginRate;
    }

    public void setMarginRate(Double marginRate) {
        this.marginRate = marginRate;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getDeliveryETA() {
        return deliveryETA;
    }

    public void setDeliveryETA(String deliveryETA) {
        this.deliveryETA = deliveryETA;
    }


}
