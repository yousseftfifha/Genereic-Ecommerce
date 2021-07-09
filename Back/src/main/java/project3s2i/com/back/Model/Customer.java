package project3s2i.com.back.Model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity

@Table(name = "customer")
public class Customer {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	@Size(max = 20)
	private String username;
	@NotBlank
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
	private Set<Role> roles = new HashSet<>();
	
	public Customer(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}

}
