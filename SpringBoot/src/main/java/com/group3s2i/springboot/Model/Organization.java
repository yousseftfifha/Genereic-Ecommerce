package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
@Entity
@Table(name = "organization")
public class Organization implements Serializable {

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
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonIgnoreProperties
    @ToString.Exclude
    private List<Unity> unities = new ArrayList<> ();

    @OneToMany(
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JsonIgnoreProperties
    @ToString.Exclude
    private List<DeliverySupplier> deliverySuppliers;

    public Organization() {
    }


}
