package com.group3s2i.springboot.Controller;


import com.group3s2i.springboot.Config.request.LoginRequest;
import com.group3s2i.springboot.Config.request.SignupRequest;
import com.group3s2i.springboot.Config.response.JwtResponse;
import com.group3s2i.springboot.Config.response.MessageResponse;
import com.group3s2i.springboot.Config.util.JwtUtils;
import com.group3s2i.springboot.DAO.RoleRepository;
import com.group3s2i.springboot.DAO.UserRepository;
import com.group3s2i.springboot.Exceptions.ResourceNotFoundException;
import com.group3s2i.springboot.Model.ERole;
import com.group3s2i.springboot.Model.Role;
import com.group3s2i.springboot.Model.User;
import com.group3s2i.springboot.Service.MailService;
import com.group3s2i.springboot.Service.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;


import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
	

	@Autowired
	UserRepository userRepository;
	@Autowired
	private AuthenticationManager authenticationManager;
	@Autowired
	RoleRepository roleRepository;
	@Autowired
	PasswordEncoder encoder;
	@Autowired
	JwtUtils jwtUtils;

	private final MailService mailService;

	public AuthController(MailService mailService) {
		this.mailService = mailService;
	}


	@PostMapping("/signin")
	public ResponseEntity<?> authenticateCustomer(@Valid @RequestBody LoginRequest loginRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		List<String> roles = userDetails.getAuthorities().stream()
				.map(GrantedAuthority::getAuthority)
				.collect(Collectors.toList());
		AtomicInteger isRole = new AtomicInteger ();//0 for admin && 1 for customer
		roles.forEach(role -> {
			if ("ROLE_ADMIN".equals (role)) {
				isRole.set (0);
			} else {
				isRole.set (1);
			}
		});
		if(isRole.get ()==0) {

			return ResponseEntity.ok (new JwtResponse (jwt,
					userDetails.getId (),
					userDetails.getUsername (),
					userDetails.getEmail (),
					roles, userDetails.getEmployee ()));
		}
		else if(isRole.get ()==1) {
			return ResponseEntity.ok (new JwtResponse (jwt,
					userDetails.getId (),
					userDetails.getUsername (),
					userDetails.getEmail (),
					roles, userDetails.getEmployee ()));
		}
		return ResponseEntity.ok(new MessageResponse("BAD CREDENTIALS!"));

	}

	@CrossOrigin(origins = "http://localhost:4200")
	@PostMapping("/signup")
	public ResponseEntity<?> registerCustomer(@Valid @RequestBody SignupRequest signUpRequest) throws ResourceNotFoundException {
		if (userRepository.existsByUsername(signUpRequest.getUsername())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse ("Error: Username is already taken!"));
		}

		if (userRepository.existsByEmail(signUpRequest.getEmail())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Email is already in use!"));
		}

		// Create new user's account
		User user = new User(signUpRequest.getUsername(),
							 signUpRequest.getEmail(),
							 encoder.encode(signUpRequest.getPassword()));
		Set<String> strRoles = signUpRequest.getRole();
		Set<Role> roles = new HashSet<>();

		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
			user.setCustomer (signUpRequest.getCustomer ());
			user.getCustomer ().setUrl ("http://localhost:8081/downloadFile/image_picker4915816687608941235.jpg");
			user.getCustomer ().setUser (user);

		} else {
			strRoles.forEach(role -> {
				if ("ROLE_ADMIN".equals (role)) {
					Role adminRole = roleRepository.findByName (ERole.ROLE_ADMIN)
							.orElseThrow (() -> new RuntimeException ("Error: Role is not found."));
					roles.add (adminRole);
					user.setEmployee (signUpRequest.getEmployee ());
					user.getEmployee ().setUser (user);

				} else {
					Role userRole = roleRepository.findByName (ERole.ROLE_USER)
							.orElseThrow (() -> new RuntimeException ("Error: Role is not found."));
					roles.add (userRole);
					user.setCustomer (signUpRequest.getCustomer ());
					user.getCustomer ().setUser (user);

				}
			});
		}
		user.setRoles(roles);

		String message= "Dear User "+user.getUsername ()+"\n you are receiving because " +
				"your subscription have been Successful" +
				"\n Username:"+user.getUsername ()+
				"\n Have a Great Day."
				;
		ExecutorService emailExecutor = Executors.newSingleThreadExecutor();
		emailExecutor.execute(() -> mailService.sendEmail ("youssef.tfifha@esprit.tn","Welcome To 3s2i E-Shop",message));
		emailExecutor.shutdown();

		userRepository.save(user);

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}


}
