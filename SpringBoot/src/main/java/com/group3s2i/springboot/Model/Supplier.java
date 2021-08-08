package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.*;
import com.voodoodyne.jackson.jsog.JSOGGenerator;
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
@JsonIgnoreProperties("supplier")
public class Supplier implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = true)
    private String name;

    @Column(name = "fiscalcode", nullable = true)
    private String fiscalCode;

    @Column(name = "patentcode", nullable = true)
    private String patentcode;

    @Column(name = "legalstatus", nullable = true)
    private String legalStatus;

    @Column(name = "category", nullable = true)
    private String category;

    @Column(name = "finality", nullable = true)
    private String finality;

    @Column(name = "size", nullable = true)
    private String size;

    @Column(name = "sector", nullable = true)
    private String sector;

    @Column(name = "scope", nullable = true)
    private String scope;

//    @OneToMany(mappedBy = "supplier",
//            cascade = CascadeType.ALL,
//            orphanRemoval = true)
//    @ToString.Exclude
//    @JsonManagedReference(value = "supplier-ps")
//    private List<ProductSupplier> productSuppliers;



//    @ManyToMany
//    @JoinTable( name = "product_supplier",
//            joinColumns = @JoinColumn(referencedColumnName = "id", name = "productId"),
//            inverseJoinColumns = @JoinColumn(referencedColumnName = "id", name = "supplierId"))
//    public List<Product> products;
        @ManyToMany(mappedBy = "suppliers")
        @ToString.Exclude
        @JsonIgnore
        private  Set<Product> products= new HashSet<> ();


    public Supplier() {
    }


}
