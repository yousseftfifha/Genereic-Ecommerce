package com.group3s2i.springboot.Model;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.util.Objects;

@Getter
@Setter
@ToString
@Entity
@Table(name = "productdetails")
public class ProductDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "attribute")
    private String attribute;

    @Column(name = "value")
    private String value;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="product", referencedColumnName = "id")
    @JsonIgnoreProperties("product")
    @JsonBackReference
    @ToString.Exclude
    private Product product;

    public ProductDetails() {
    }

    public ProductDetails(Long id, String attribute, String value, Product productid) {
        this.id = id;
        this.attribute = attribute;
        this.value = value;
        this.product = productid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product productid) {
        this.product = productid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass (this) != Hibernate.getClass (o)) return false;
        ProductDetails that = (ProductDetails) o;

        return Objects.equals (id, that.id);
    }

    @Override
    public int hashCode() {
        return 555209333;
    }
}
