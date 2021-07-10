package project3s2i.com.back.Model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.hibernate.Hibernate;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Getter
@Setter
@ToString
@Entity
@Table(name = "customer")
public class Customer {
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
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(	name = "customer_roles",
				joinColumns = @JoinColumn(name = "customer_id"),
				inverseJoinColumns = @JoinColumn(name = "role_id"))
	@ToString.Exclude
	private Set<Role> roles = new HashSet<>();

	@OneToOne(fetch = FetchType.LAZY,
			cascade = CascadeType.ALL,
			mappedBy = "customer")
	@JsonIgnoreProperties("customer")
	private User userProfile;

	public Customer() {
	}

	public Customer(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public Customer(String username,String email, String password,  User userProfile) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.userProfile = userProfile;
	}

	public Customer(Long id, String username, String password, String email, User userProfile) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.userProfile = userProfile;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public User getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(User userProfile) {
		this.userProfile = userProfile;
	}

	@Override
	public String toString() {
		return "Customer{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", roles=" + roles +
				", userProfile=" + userProfile +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || Hibernate.getClass (this) != Hibernate.getClass (o)) return false;
		Customer customer = (Customer) o;

		return Objects.equals (id, customer.id);
	}

	@Override
	public int hashCode() {
		return 339958611;
	}
}
