package com.group3s2i.springboot.Model;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "roles")
@NoArgsConstructor @AllArgsConstructor @ToString
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private ERole name;
}
