package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_date")
    @CreatedDate
    private Date createdDate;

    @Column(name = "canceled_date")
    private LocalDateTime cancelledDate;

    @Column(name = "canceled_reason")
    private String cancelledReason;

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
    @JsonManagedReference(value = "p-s")
    private Set<Supplier> suppliers = new HashSet<> ();
    public Product() {
    }


}
