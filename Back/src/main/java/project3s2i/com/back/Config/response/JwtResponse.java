package project3s2i.com.back.Config.response;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import project3s2i.com.back.Model.User;

@Data @NoArgsConstructor 
public class JwtResponse {
	private String token;
	private String type = "Bearer";
	private Long id;
	private String username;
	private String email;
	private List<String> roles;
	private User user;
	public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles,User user) {
		this.token = accessToken;
		this.id = id;
		this.username = username;
		this.email = email;
		this.roles = roles;
		this.user=user;
	}

}
