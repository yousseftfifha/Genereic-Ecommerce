package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Entity
@Table(name = "order_customer_items")
public class OrderCustomerItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "item_seq")
    private  int itemSeq;

    @Column(name = "quantity")
    private @NotNull int quantity;


    @Column(name = "vat_code")
    private  Double vatCode;

    @Column(name = "discount_code")
    private  Double discountCode;

    @Column(name = "created_date")
    private LocalDateTime createdDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="order_id", referencedColumnName = "id")
    @JsonIgnoreProperties("order")
    @ToString.Exclude
    @JsonBackReference(value = "m-d")
    private OrderCustomer orderCustomer;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonProperty("product")
    private Product product;

    public OrderCustomerItem() {
    }
}
