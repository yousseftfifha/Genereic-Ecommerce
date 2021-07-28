package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * @author tfifha youssef
 */

@Getter
@Setter
@ToString
@Entity
@Table(name = "supplier")
public class Supplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "fiscalcode", nullable = false)
    private String fiscalCode;

    @Column(name = "patentcode", nullable = false)
    private String patentcode;

    @Column(name = "legalstatus", nullable = false)
    private String legalStatus;

    @Column(name = "category", nullable = false)
    private String category;

    @Column(name = "finality", nullable = false)
    private String finality;

    @Column(name = "size", nullable = false)
    private String size;

    @Column(name = "sector", nullable = false)
    private String sector;

    @Column(name = "scope", nullable = false)
    private String scope;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name="product", referencedColumnName = "id")
//    @JsonIgnoreProperties("product")
//    @JsonBackReference
//    @ToString.Exclude
//    private Product product;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name="productsupplier", referencedColumnName = "id")
//    @JsonIgnoreProperties("product")
//    @JsonBackReference
//    @ToString.Exclude
//    private ProductSupplier productSupplier;
@ManyToMany(fetch = FetchType.LAZY)
@JoinTable(	name = "productsupplier",
        joinColumns = @JoinColumn(name = "supplier_id"),
        inverseJoinColumns = @JoinColumn(name = "product_id"))
@ToString.Exclude
private List<Product> products ;

    @OneToMany(
            mappedBy = "supplier",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonManagedReference
    private List<SalesOrder> salesOrders;
    public Supplier() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFiscalCode() {
        return fiscalCode;
    }

    public void setFiscalCode(String fiscalCode) {
        this.fiscalCode = fiscalCode;
    }

    public String getPatentcode() {
        return patentcode;
    }

    public void setPatentcode(String patentcode) {
        this.patentcode = patentcode;
    }

    public String getLegalStatus() {
        return legalStatus;
    }

    public void setLegalStatus(String legalStatus) {
        this.legalStatus = legalStatus;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFinality() {
        return finality;
    }

    public void setFinality(String finality) {
        this.finality = finality;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass (this) != Hibernate.getClass (o)) return false;
        Supplier supplier = (Supplier) o;

        return Objects.equals (id, supplier.id);
    }

    @Override
    public int hashCode() {
        return 554628605;
    }
}
