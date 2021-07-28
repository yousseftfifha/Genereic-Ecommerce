package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.ToString;

import javax.persistence.*;

/**
 * @author tfifha youssef
 */
@Entity
@Table(name = "unity")
public class Unity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "unity_name")
    private String unityName;

    @Column(name = "unity_code")
    private String unityCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="unity_sub_id", referencedColumnName = "id")
    @JsonBackReference
    @ToString.Exclude
    private Unity UnitySubID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="organization", referencedColumnName = "id")
    @JsonIgnoreProperties("organization")
    @JsonBackReference
    @ToString.Exclude
    private Organization organization;
}
