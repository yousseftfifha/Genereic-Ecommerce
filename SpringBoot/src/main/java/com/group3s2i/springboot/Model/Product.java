package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
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

    @Column(name = "brand")
    private String brand;

    @Column(name = "description")
    private String description;



    @Column(name = "sku")
    private Integer sku;

    @Column(name = "isbn")
    private Integer isbn;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="category", referencedColumnName = "id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ToString.Exclude
    private Category category;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "product")
    @JsonIgnoreProperties("product")
    @ToString.Exclude
    private Productinformation information;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "product")
    @JsonIgnoreProperties("product")
    @ToString.Exclude
    private ProductPrice productPrice;




    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonManagedReference
    @ToString.Exclude
    private List<Mouvement> mouvements = new ArrayList<> ();

    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonManagedReference
    @ToString.Exclude
    private List<ProductImage> productImages = new ArrayList<> ();

    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonManagedReference
    @ToString.Exclude
    private List<ProductDetails> details = new ArrayList<> ();



    public Product(Long id, String tmpCode, String code, String name, String description, String brand, Integer sku, Integer isbn, Category category, Productinformation information, List<ProductImage> productImages, List<ProductDetails> details) {
        this.id = id;
        this.tmpCode = tmpCode;
        this.code = code;
        this.name = name;
        this.description = description;
        this.brand = brand;
        this.sku = sku;
        this.isbn = isbn;
        this.category = category;
        this.information = information;
        this.productImages = productImages;
        this.details = details;
    }

    public Product() {
    }

    public List<Mouvement> getMouvements() {
        return mouvements;
    }

    public void setMouvements(List<Mouvement> mouvements) {
        this.mouvements = mouvements;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Productinformation getInformation() {
        return information;
    }

    public void setInformation(Productinformation information) {
        this.information = information;
    }

    public List<ProductImage> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<ProductImage> productImages) {
        this.productImages = productImages;
    }

    public List<ProductDetails> getDetails() {
        return details;
    }

    public void setDetails(List<ProductDetails> details) {
        this.details = details;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass (this) != Hibernate.getClass (o)) return false;
        Product product = (Product) o;

        return Objects.equals (id, product.id);
    }

    @Override
    public int hashCode() {
        return 2042274511;
    }
}
