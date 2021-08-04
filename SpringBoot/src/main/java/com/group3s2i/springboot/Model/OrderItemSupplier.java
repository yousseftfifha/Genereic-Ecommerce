package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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

    @Column(name = "unit_price")
    private  Double unitPrice;

    @Column(name = "vat_code")
    private  Double vatCode;

    @Column(name = "discount_rate")
    private  Double discountRate;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @ToString.Exclude
    private OrderSupplier orderSupplier;

    @OneToOne
    @JoinColumn(name = "product_supplier_id", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private ProductSupplier productSupplier;

    public OrderItemSupplier() {
    }

}
