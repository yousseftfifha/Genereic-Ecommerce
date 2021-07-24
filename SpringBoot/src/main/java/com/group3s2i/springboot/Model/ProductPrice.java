package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "productprice")
public class ProductPrice {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "supplies")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Supplies supplies;

    @Column(name = "vc", nullable = false)
    private Double vc;

    @Column(name = "fc", nullable = false)
    private Double fv;
}
