package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "productprice")
public class ProductPrice {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @Column(name = "vc", nullable = false)
    private Double vc;

    @Column(name = "fc", nullable = false)
    private Double fv;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product")
    @ToString.Exclude
    private Product product;
    public ProductPrice() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getVc() {
        return vc;
    }

    public void setVc(Double vc) {
        this.vc = vc;
    }

    public Double getFv() {
        return fv;
    }

    public void setFv(Double fv) {
        this.fv = fv;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
