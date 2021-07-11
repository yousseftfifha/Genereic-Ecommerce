package com.group3s2i.springboot.Config.response;

import com.group3s2i.springboot.Model.Customer;
import com.group3s2i.springboot.Model.Employees;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data @NoArgsConstructor 
public class JwtResponse {
	private String token;
	private String type = "Bearer";
	private Long id;
	private String username;
	private String email;
	private List<String> roles;
	private Customer customer;
	private Employees employee;


	public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles) {
		this.token = accessToken;
		this.id = id;
		this.username = username;
		this.email = email;
		this.roles = roles;
	}
	public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles,Customer customer) {
		this.token = accessToken;
		this.id = id;
		this.username = username;
		this.email = email;
		this.roles = roles;
		this.customer=customer;
	}
	public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles, Employees employee) {
		this.token = accessToken;
		this.id = id;
		this.username = username;
		this.email = email;
		this.roles = roles;
		this.employee=employee;
	}
}
