package com.group3s2i.springboot.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@Table(name = "unity")
public class Unity implements Serializable {

    private static final long serialVersionUID = 1L;

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
    @JoinColumn(name="organization_id", referencedColumnName = "id")
    @JsonIgnoreProperties("organization")
    @ToString.Exclude
    private Organization organization;

    public Unity() {
    }
}
