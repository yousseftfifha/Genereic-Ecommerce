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
import java.util.Objects;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity(name="ProductSupplierEntity")
@Table(name = "product_supplier")
public class ProductSupplier implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    public  ProductSupplierId id;
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


    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "currency_id")
    @ToString.Exclude
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Currency currency;

    public ProductSupplier() {
    }
  public ProductSupplier(Product product,Supplier supplier) {
      id = new ProductSupplier.ProductSupplierId ();
      id.product_id = product.getId ();
      id.supplier_id = supplier.getId ();
    }

    public ProductSupplier(Product product,Supplier supplier, String supplierProductCode, String deliveryETA, Double vatCode, Double discountRate, Double unitPrice, LocalDateTime createdDate, Currency currency) {
        id = new ProductSupplier.ProductSupplierId ();
        id.product_id = product.getId ();
        id.supplier_id = supplier.getId ();
        this.supplierProductCode = supplierProductCode;
        this.deliveryETA = deliveryETA;
        this.vatCode = vatCode;
        this.discountRate = discountRate;
        this.unitPrice = unitPrice;
        this.createdDate = createdDate;
        this.currency = currency;
    }

    @Embeddable
    public static class ProductSupplierId implements Serializable {

        public Long product_id;
        public Long supplier_id;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass () != o.getClass ()) return false;
            ProductSupplierId that = (ProductSupplierId) o;
            return Objects.equals (product_id, that.product_id) && Objects.equals (supplier_id, that.supplier_id);
        }

        @Override
        public int hashCode() {
            return Objects.hash (product_id, supplier_id);
        }
    }

}
