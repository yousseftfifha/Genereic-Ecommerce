package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "product_extra_cost")
public class ProductExtraCost implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;



    @Column(name = "fixed_cost", nullable = false)
    private Double fixedCost;

    @Column(name = "variable_cost", nullable = false)
    private Double variableCost;

    @Column(name = "profit_margin", nullable = false)
    private Double profitMargin;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    @ToString.Exclude
    @JsonBackReference(value = "product-cost")
    private Product product;
    public ProductExtraCost() {
    }


}
