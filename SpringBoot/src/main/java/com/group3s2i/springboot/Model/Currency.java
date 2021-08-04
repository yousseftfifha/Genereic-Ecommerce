package com.group3s2i.springboot.Model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "currency")
public class Currency implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "currency_name")
    private String currencyName;

    @Column(name = "currency_code")
    private String currencyCode;

    @Column(name = "currency_rate")
    private String currencyRate;

    public Currency() {
    }
}
