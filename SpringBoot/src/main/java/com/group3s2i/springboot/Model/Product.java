package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.*;
import com.voodoodyne.jackson.jsog.JSOGGenerator;
import lombok.*;
import org.exolab.castor.types.DateTime;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.*;

@Getter
@Setter
@ToString
@Entity
@Table(name = "product")
@AllArgsConstructor
@JsonIgnoreProperties("product")
public class Product  implements Serializable {

    private static final long serialVersionUID = 1L;

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
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ToString.Exclude
    @JsonManagedReference(value = "product-info")
    private Productinformation information;

    @OneToOne(fetch = FetchType.LAZY, cascade =  CascadeType.ALL, mappedBy = "product")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ToString.Exclude
    @JsonManagedReference(value = "product-cost")
    private ProductExtraCost productExtraCost;

    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @ToString.Exclude
    @JsonManagedReference(value = "product_mouvement")
    private List<Mouvement> mouvements = new ArrayList<> ();

    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @ToString.Exclude
    @JsonManagedReference(value = "product_image")
    private List<ProductImage> productImages = new ArrayList<> ();

    @OneToMany(
            mappedBy = "product",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @ToString.Exclude
    @JsonManagedReference(value = "product_detail")
    private List<ProductDetails> details = new ArrayList<> ();

//    @OneToMany(mappedBy = "product",
//            cascade = CascadeType.ALL,
//            orphanRemoval = true)
//    @ToString.Exclude
//    @JsonManagedReference(value = "product-ps")
//    private List<ProductSupplier> productSuppliers;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "product_supplier",
            joinColumns = @JoinColumn(name = "product_id",referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "supplier_id",referencedColumnName = "id"))
    @ToString.Exclude
    private Set<Supplier> suppliers = new HashSet<> ();



    public Product() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass () != o.getClass ()) return false;
        Product product = (Product) o;
        return Objects.equals (getId (), product.getId ()) && Objects.equals (getTmpCode (), product.getTmpCode ()) && Objects.equals (getCode (), product.getCode ()) && Objects.equals (getName (), product.getName ()) && Objects.equals (getBrand (), product.getBrand ()) && Objects.equals (getDescription (), product.getDescription ()) && Objects.equals (getSku (), product.getSku ()) && Objects.equals (getIsbn (), product.getIsbn ()) && Objects.equals (getCategory (), product.getCategory ()) && Objects.equals (getInformation (), product.getInformation ()) && Objects.equals (getProductExtraCost (), product.getProductExtraCost ()) && Objects.equals (getMouvements (), product.getMouvements ()) && Objects.equals (getProductImages (), product.getProductImages ()) && Objects.equals (getDetails (), product.getDetails ()) && Objects.equals (getSuppliers (), product.getSuppliers ());
    }

    @Override
    public int hashCode() {
        return Objects.hash (getId (), getTmpCode (), getCode (), getName (), getBrand (), getDescription (), getSku (), getIsbn (),  getCategory (), getInformation (), getProductExtraCost (), getMouvements (), getProductImages (), getDetails (), getSuppliers ());
    }
}
