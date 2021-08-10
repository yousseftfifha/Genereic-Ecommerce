package com.group3s2i.springboot.Model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.Hibernate;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
@Entity
@Table(name = "customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "firstname")
	private String firstName;

	@Column(name = "lastname")
	private String lastName;

	@Column(name = "cellphone")
	private String phoneNumber;

	@Enumerated(EnumType.STRING)
	@Column(length = 10)
	private Gender gender;

	@Temporal(TemporalType.DATE)
	@Column(name = "dateofbirth")
	private Date dateOfBirth;

	@Column(name = "url")
	private String url;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	@ToString.Exclude
	private User user;

	@OneToMany(
			mappedBy = "customer",
			cascade = CascadeType.ALL,
			orphanRemoval = true
	)
	@ToString.Exclude
	@JsonManagedReference(value = "customer_address")
	private List<AddressCustomer> addressList = new ArrayList<> ();

	@OneToMany(
			mappedBy = "customer",
			cascade = CascadeType.ALL,
			orphanRemoval = true
	)
	@ToString.Exclude
	@JsonManagedReference(value = "o-s")
	private List<OrderCustomer> orderCustomers = new ArrayList<> ();
	@OneToMany(
			mappedBy = "customer",
			cascade = CascadeType.ALL,
			orphanRemoval = true
	)
	@ToString.Exclude
	@JsonManagedReference(value = "cart")
	private List<Cart> cartList = new ArrayList<> ();
	@OneToMany(
			mappedBy = "customer",
			cascade = CascadeType.ALL,
			orphanRemoval = true
	)
	@ToString.Exclude
	@JsonManagedReference(value = "caa")
	private List<DeliveryCustomer> deliveryCustomers = new ArrayList<> ();
	public Customer() {
	}

}
