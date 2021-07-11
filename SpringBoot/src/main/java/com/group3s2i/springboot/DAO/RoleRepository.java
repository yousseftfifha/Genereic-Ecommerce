package com.group3s2i.springboot.DAO;


import com.group3s2i.springboot.Model.ERole;
import com.group3s2i.springboot.Model.Role;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.Optional;

public interface RoleRepository  extends JpaRepository<Role, Long>{
	Optional<Role> findByName(ERole name);

}
