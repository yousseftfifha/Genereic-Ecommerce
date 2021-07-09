package project3s2i.com.back.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import project3s2i.com.back.Config.request.LoginRequest;
import project3s2i.com.back.Config.request.SignupRequest;
import project3s2i.com.back.Config.response.JwtResponse;
import project3s2i.com.back.Config.response.MessageResponse;
import project3s2i.com.back.Config.util.JwtUtils;
import project3s2i.com.back.DAO.CustomerRepository;
import project3s2i.com.back.DAO.RoleRepository;
import project3s2i.com.back.Model.Customer;
import project3s2i.com.back.Model.ERole;
import project3s2i.com.back.Model.Role;
import project3s2i.com.back.Service.CustomerDetailsImpl;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
	
	@Autowired
	CustomerRepository customerRepository;
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	PasswordEncoder encoder;
	@Autowired
	JwtUtils jwtUtils;
	
	
	@PostMapping("/signin")
	public ResponseEntity<?> authenticateCustomer(@Valid @RequestBody LoginRequest loginRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		CustomerDetailsImpl customerDetails = (CustomerDetailsImpl) authentication.getPrincipal();
		List<String> roles = customerDetails.getAuthorities().stream()
				.map(item -> item.getAuthority())
				.collect(Collectors.toList());

		return ResponseEntity.ok(new JwtResponse (jwt,
												 customerDetails.getId(),
												 customerDetails.getUsername(),
												 customerDetails.getEmail(),
												 roles));
	}
	
	@PostMapping("/signup")
	public ResponseEntity<?> registerCustomer(@Valid @RequestBody SignupRequest signUpRequest) {
		if (customerRepository.existsByUsername(signUpRequest.getUsername())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse ("Error: Username is already taken!"));
		}

		if (customerRepository.existsByEmail(signUpRequest.getEmail())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Email is already in use!"));
		}

		// Create new customer's account
		Customer customer = new Customer(signUpRequest.getUsername(),
							 signUpRequest.getEmail(),
							 encoder.encode(signUpRequest.getPassword()));

		Set<String> strRoles = signUpRequest.getRole();
		Set<Role> roles = new HashSet<>();

		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);

					break;
				default:
					Role userRole = roleRepository.findByName(ERole.ROLE_USER)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
				}
			});
		}
		customer.setRoles(roles);
		customerRepository.save(customer);

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}

}
