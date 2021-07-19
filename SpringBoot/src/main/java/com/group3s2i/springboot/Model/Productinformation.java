package com.group3s2i.springboot.Model;

import javax.persistence.*;

@Entity
@Table(name = "productinformation")
public class Productinformation {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer max;

    private Integer min;

    private Integer threshold;

    private Integer security;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product")
    private Product product;

    public Productinformation( ) {
    }

    public Productinformation(Long id, Integer max, Integer min, Integer threshold, Integer security) {
        this.id = id;
        this.max = max;
        this.min = min;
        this.threshold = threshold;
        this.security = security;
    }

    public Productinformation(Long id, Integer max, Integer min, Integer threshold, Integer security, Product product) {
        this.id = id;
        this.max = max;
        this.min = min;
        this.threshold = threshold;
        this.security = security;
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
    }

    public Integer getMin() {
        return min;
    }

    public void setMin(Integer min) {
        this.min = min;
    }

    public Integer getThreshold() {
        return threshold;
    }

    public void setThreshold(Integer threshold) {
        this.threshold = threshold;
    }

    public Integer getSecurity() {
        return security;
    }

    public void setSecurity(Integer security) {
        this.security = security;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product productID) {
        this.product = productID;
    }
}
