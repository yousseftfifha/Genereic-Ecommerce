package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.assertj.core.internal.ErrorMessages;

import javax.persistence.*;
import javax.validation.constraints.FutureOrPresent;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "product_supplier")
public class ProductSupplier implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supplier_id",referencedColumnName = "id")
    @ToString.Exclude
    @JsonBackReference(value = "supplier-ps")
    private Supplier supplier;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id",referencedColumnName = "id" )
    @ToString.Exclude
    @JsonBackReference(value = "product-ps")
    private Product product;

    @Column(name = "supplier_product_code")
    private String supplierProductCode;

    @Column(name = "delivery_eta")
    private String deliveryETA;

    @Column(name = "vat_code")
    private Double vatCode;

    @Column(name = "discount_rate")
    private Double discountRate;


    @Column(name = "unit_price")
    private Double unitPrice;

    @Temporal (TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    private Date createdDate;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "currency_id")
    @ToString.Exclude
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Currency currency;

    public ProductSupplier() {
    }


}
