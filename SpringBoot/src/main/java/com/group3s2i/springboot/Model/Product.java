package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "product")
public class Product  {


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tmpcode")
    private String tmpCode;

    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "brand")
    private String brand;

    @Column(name = "sku")
    private Integer sku;

    @Column(name = "isbn")
    private Integer isbn;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="categoryID", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Category categoryID;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "productID")
    @JsonIgnoreProperties("productID")
    private Productdetails details;



    public Product() {
    }

    public Product(Long id, String tmpCode, String code, String name, String description, String brand, String mesureUnit, Double weight, Double height, Integer sku, Integer upc, Integer isbn, Integer isExpirable, Integer isReparable, String rexture, Integer stock, Integer imageID, Category categoryID,Productdetails details) {
        this.id = id;
        this.tmpCode = tmpCode;
        this.code = code;
        this.name = name;
        this.description = description;
        this.brand = brand;
        this.sku = sku;
        this.isbn = isbn;
        this.categoryID = categoryID;
        this.details=details;
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTmpCode() {
        return tmpCode;
    }

    public void setTmpCode(String tmpCode) {
        this.tmpCode = tmpCode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Integer getSku() {
        return sku;
    }

    public void setSku(Integer sku) {
        this.sku = sku;
    }


    public Integer getIsbn() {
        return isbn;
    }

    public void setIsbn(Integer isbn) {
        this.isbn = isbn;
    }

    public Category getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(Category categoryID) {
        this.categoryID = categoryID;
    }

    public Productdetails getDetails() { return details; }

    public void setDetails(Productdetails details) { this.details = details; }
}
