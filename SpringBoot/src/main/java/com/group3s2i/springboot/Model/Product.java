package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "product")
public class Product  {


    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tmpCode", nullable = false)
    private String tmpCode;

    @Column(name = "code", nullable = false)
    private String code;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "brand", nullable = false)
    private String brand;

    @Column(name = "mesureUnit", nullable = false)
    private String mesureUnit;

    @Column(name = "weight", nullable = false)
    private Double weight;

    @Column(name = "height", nullable = false)
    private Double height;

    @Column(name = "sku", nullable = false)
    private Integer sku;

    @Column(name = "upc", nullable = false)
    private Integer upc;

    @Column(name = "isbn", nullable = false)
    private Integer isbn;

    @Column(name = "isExpirable", nullable = false)
    private Integer isExpirable;

    @Column(name = "isReparable", nullable = false)
    private Integer isReparable;

    @Column(name = "rexture", nullable = false)
    private String rexture;

    @Column(name = "stock", nullable = false)
    private Integer stock;


    @Column(name = "imageID", nullable = false)
    private Integer imageID;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
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
        this.mesureUnit = mesureUnit;
        this.weight = weight;
        this.height = height;
        this.sku = sku;
        this.upc = upc;
        this.isbn = isbn;
        this.isExpirable = isExpirable;
        this.isReparable = isReparable;
        this.rexture = rexture;
        this.stock = stock;
        this.imageID = imageID;
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

    public String getMesureUnit() {
        return mesureUnit;
    }

    public void setMesureUnit(String mesureUnit) {
        this.mesureUnit = mesureUnit;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Integer getSku() {
        return sku;
    }

    public void setSku(Integer sku) {
        this.sku = sku;
    }

    public Integer getUpc() {
        return upc;
    }

    public void setUpc(Integer upc) {
        this.upc = upc;
    }

    public Integer getIsbn() {
        return isbn;
    }

    public void setIsbn(Integer isbn) {
        this.isbn = isbn;
    }

    public Integer getIsExpirable() {
        return isExpirable;
    }

    public void setIsExpirable(Integer isExpirable) {
        this.isExpirable = isExpirable;
    }

    public Integer getIsReparable() {
        return isReparable;
    }

    public void setIsReparable(Integer isReparable) {
        this.isReparable = isReparable;
    }

    public String getRexture() {
        return rexture;
    }

    public void setRexture(String rexture) {
        this.rexture = rexture;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getImageID() {
        return imageID;
    }

    public void setImageID(Integer imageID) {
        this.imageID = imageID;
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
