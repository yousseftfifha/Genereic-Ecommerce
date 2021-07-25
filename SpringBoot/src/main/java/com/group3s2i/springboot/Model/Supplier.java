package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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

    @OneToMany(
            mappedBy = "supplier",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonManagedReference
    @ToString.Exclude
    private List<Supplies> supplies = new ArrayList<> ();
    public Supplier() {
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
