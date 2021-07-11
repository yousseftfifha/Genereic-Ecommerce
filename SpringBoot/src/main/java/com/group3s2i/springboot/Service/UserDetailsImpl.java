package com.group3s2i.springboot.Service;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.group3s2i.springboot.Model.Customer;
import com.group3s2i.springboot.Model.Employees;
import com.group3s2i.springboot.Model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class UserDetailsImpl implements UserDetails {
	private static final long serialVersionUID = 1L;

	private Long id;

	private String username;

	private String email;

	@JsonIgnore
	private String password;

	private Customer customer;
	private Employees employee;

	private Collection<? extends GrantedAuthority> authorities;

	public UserDetailsImpl(Long id, String username, String email, String password,
						   Collection<? extends GrantedAuthority> authorities) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.authorities = authorities;
	}
	public UserDetailsImpl(Long id, String username, String email, String password,
						   Collection<? extends GrantedAuthority> authorities,Customer customer) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.authorities = authorities;
		this.customer=customer;
	}	public UserDetailsImpl(Long id, String username, String email, String password,
						   Collection<? extends GrantedAuthority> authorities,Employees employee) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.authorities = authorities;
		this.employee=employee;
	}
	public static UserDetailsImpl build(User user) {
		List<GrantedAuthority> authorities = user.getRoles().stream()
				.map(role -> new SimpleGrantedAuthority(role.getName().name()))
				.collect(Collectors.toList());

		AtomicInteger isRole = new AtomicInteger ();//0 for admin && 1 for customer
		authorities.forEach(role -> {
			isRole.set (1);
		});
		if(isRole.get ()==0) {
		return new UserDetailsImpl (
				user.getId(),
				user.getUsername(),
				user.getEmail(),
				user.getPassword(),
				authorities,
				user.getEmployee ());
	}
		else {
			return new UserDetailsImpl (
					user.getId(),
					user.getUsername(),
					user.getEmail(),
					user.getPassword(),
					authorities,
					user.getCustomer ());
		}
	}

	public Customer getCustomer() {
		return customer;
	}

	public Employees getEmployee() {
		return employee;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}


	public Long getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		UserDetailsImpl user = (UserDetailsImpl) o;
		return Objects.equals(id, user.id);
	}
}
