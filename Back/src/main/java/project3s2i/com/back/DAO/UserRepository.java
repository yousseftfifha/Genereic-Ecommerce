package project3s2i.com.back.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project3s2i.com.back.Model.User;

/**
 * @author tfifha youssef
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

}