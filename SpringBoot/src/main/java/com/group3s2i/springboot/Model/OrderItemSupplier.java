package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "order_supplier_items")
public class OrderItemSupplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "item_seq")
    private  int itemSeq;

    @Column(name = "quantity")
    private @NotNull int quantity;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @ToString.Exclude
    @JsonBackReference(value = "a-b")
    private OrderSupplier orderSupplier;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonProperty("product")
    private Product product;

//    @OneToOne
//    @JoinColumn(name = "product_supplier_id", referencedColumnName = "id")
//    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
//    private ProductSupplier productSupplier;

    public OrderItemSupplier() {
    }

}
