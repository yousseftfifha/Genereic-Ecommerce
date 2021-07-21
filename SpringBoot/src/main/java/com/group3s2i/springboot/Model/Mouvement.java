package com.group3s2i.springboot.Model;

import lombok.Data;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Data
@Entity
@Table(name = "mouvement")
public class Mouvement {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product")
    private Product product;

    private int ins;

    private int outs;

    @Column(name = "transfered")
    private int transfered;

    @Column(name = "unit_price")
    private double unit_price;

    @Column (name = "quantity")
    private Long quantity;


    public Mouvement() {
    }

    public Mouvement(Long id, Product product, int in, int out, int transfered, double unit_price, Long quantity) {
        this.id = id;
        this.product = product;
        this.ins = in;
        this.outs = out;
        this.transfered = transfered;
        this.unit_price = unit_price;
        this.quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getIns() {
        return ins;
    }

    public void setIns(int in) {
        this.ins = in;
    }

    public int getOuts() {
        return outs;
    }

    public void setOuts(int out) {
        this.outs = out;
    }

    public int getTransfered() {
        return transfered;
    }

    public void setTransfered(int transfered) {
        this.transfered = transfered;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Mouvement{" +
                "id=" + id +
                ", product=" + product +
                ", in=" + ins +
                ", out=" + outs +
                ", transfered=" + transfered +
                ", unit_price=" + unit_price +
                ", quantity=" + quantity +
                '}';
    }
}
