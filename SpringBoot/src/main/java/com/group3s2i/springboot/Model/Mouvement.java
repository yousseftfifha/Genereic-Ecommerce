package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;
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
public class Mouvement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="product_id", referencedColumnName = "id")
    @ToString.Exclude
    @JsonBackReference(value = "product_mouvement")

    private Product product;

    @Column(name = "unit_price")
    private Double unitPrice;

    @Column(name = "mouvement_type")
    private String typeMouvement;

    @Column (name = "quantity")
    private int quantity;

    @Column (name = "delivery_item")
    private Long deliveryItem;

    @Column (name = "mouvement_date")
    private LocalDateTime mouvementDate;




    public Mouvement() {
    }

}
