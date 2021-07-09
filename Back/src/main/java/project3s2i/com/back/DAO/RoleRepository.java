package project3s2i.com.back.DAO;


import org.springframework.data.jpa.repository.JpaRepository;
import project3s2i.com.back.Model.ERole;
import project3s2i.com.back.Model.Role;

import java.util.Optional;

public interface RoleRepository  extends JpaRepository<Role, Long>{
	Optional<Role> findByName(ERole name);

}
