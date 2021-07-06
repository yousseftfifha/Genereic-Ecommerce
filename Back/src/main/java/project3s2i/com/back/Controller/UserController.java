package project3s2i.com.back.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import project3s2i.com.back.DAO.UserRepository;
import project3s2i.com.back.Model.User;

/**
 * @author tfifha youssef
 */
@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/register")
    public User Register(@RequestBody User user) {
        return userRepository.save(user);
    }
    @PostMapping("/login")
    public User Login(@RequestBody User user) {
        return userRepository.findByEmailAndPassword(user.getEmail (), user.getPassword ());
    }
}