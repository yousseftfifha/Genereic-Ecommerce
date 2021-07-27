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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
@Entity
@Table(name = "customer")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Size(max = 65)
	@Column(name = "firstname")
	private String firstName;

	@Size(max = 65)
	@Column(name = "lastname")
	private String lastName;

	@Column(name = "cellphone")
	@Size(max = 15)
	private String phoneNumber;

	@Enumerated(EnumType.STRING)
	@Column(length = 10)
	private Gender gender;

	@Temporal(TemporalType.DATE)
	@Column(name = "dateofbirth")
	private Date dateOfBirth;

	@Size(max = 255)
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
	@JsonManagedReference
	@ToString.Exclude
	private List<Address> addressList = new ArrayList<> ();

	public Customer(String firstName, String lastName, String phoneNumber, Gender gender) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
	}

	public Customer() {
	}

	public Customer(Long id, String firstName, String lastName, String phoneNumber, Gender gender, Date dateOfBirth, User user) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.user = user;
	}

	public Customer(String firstName, String lastName, String phoneNumber, Gender gender, Date dateOfBirth, User user) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.user = user;
	}

	public Customer(Long id, String firstName, String lastName, String phoneNumber, Gender gender, Date dateOfBirth) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Customer{" +
				"id=" + id +
				", firstName='" + firstName + '\'' +
				", lastName='" + lastName + '\'' +
				", phoneNumber='" + phoneNumber + '\'' +
				", gender=" + gender +
				", dateOfBirth=" + dateOfBirth +
				", user=" + user +
				'}';
	}
}
