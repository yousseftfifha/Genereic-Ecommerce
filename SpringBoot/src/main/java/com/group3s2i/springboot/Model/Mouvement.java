package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
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
    @ToString.Exclude
    private Product product;



    @Column(name = "typemouvement")
    private String typeMouvement;

    @Column (name = "quantity")
    private int quantity;

    @Column (name = "mouvementdate")
    private LocalDateTime mouvementDate;

    public Mouvement() {
    }

    public LocalDateTime getMouvementDate() {
        return mouvementDate;
    }

    public void setMouvementDate(LocalDateTime updatedat) {
        this.mouvementDate = updatedat;
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

    public String getTypeMouvement() {
        return typeMouvement;
    }

    public void setTypeMouvement(String type) {
        this.typeMouvement = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass (this) != Hibernate.getClass (o)) return false;
        Mouvement mouvement = (Mouvement) o;

        return Objects.equals (id, mouvement.id);
    }

    @Override
    public int hashCode() {
        return 2031935510;
    }
}
