package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="product", referencedColumnName = "id")
    @JsonIgnoreProperties("product")
    @JsonBackReference
    private Product product;



    @Column(name = "type")
    private int type;

    @Column (name = "quantity")
    private int quantity;

    @Column (name = "updatedat")
    private LocalDateTime updatedat;

    public Mouvement() {
    }

    public Mouvement(Long id, Product product, int type,  int quantity) {
        this.id = id;
        this.product = product;
        this.type = type;
        this.quantity = quantity;
    }

    public Mouvement(Long id, Product product, int type, int quantity, LocalDateTime updatedat) {
        this.id = id;
        this.product = product;
        this.type = type;
        this.quantity = quantity;
        this.updatedat = updatedat;
    }

    public LocalDateTime getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(LocalDateTime updatedat) {
        this.updatedat = updatedat;
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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
