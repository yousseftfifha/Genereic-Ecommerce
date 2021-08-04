package com.group3s2i.springboot.Model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.*;

/**
 * @author tfifha youssef
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "user")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @NotNull
    @Size(max = 20)
    private String username;
    @NotBlank
    @NotNull
    @Size(max = 120)
    private String password;
    @NotBlank
    @Size(max = 50)
    @Email
    private String email;

    @OneToOne(fetch = FetchType.LAZY,
            cascade = CascadeType.ALL,
            mappedBy = "user")
    @JsonIgnoreProperties("user")
    @ToString.Exclude
    private Customer customer;

    @OneToOne(fetch = FetchType.LAZY,
            cascade = {CascadeType.ALL,CascadeType.REFRESH},
            mappedBy = "user")
    @JsonIgnoreProperties("user")
    @ToString.Exclude
    private Employees employee;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    @ToString.Exclude
    private Set<Role> roles = new HashSet<> ();


    public User() {
    }

    public User(String username,  String email,String password) {
        this.username = username;
        this.password = password;
        this.email = email;
    }
}