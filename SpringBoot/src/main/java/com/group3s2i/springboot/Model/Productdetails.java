package com.group3s2i.springboot.Model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "productdetails")
public class Productdetails  {


    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "max", nullable = false)
    private Integer max;

    @Column(name = "min", nullable = false)
    private Integer min;

    @Column(name = "threshold", nullable = false)
    private Integer threshold;

    @Column(name = "security", nullable = false)
    private Integer security;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "productID", nullable = false)
    private Product productID;

    public Productdetails( ) {
    }

    public Productdetails(Long id, Integer max, Integer min, Integer threshold, Integer security, Product productID) {
        this.id = id;
        this.max = max;
        this.min = min;
        this.threshold = threshold;
        this.security = security;
        this.productID = productID;
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

    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }
}
