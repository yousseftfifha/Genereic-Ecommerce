package project3s2i.com.back.Model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Data
@Entity
@Table(name = "user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "UserID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;

    @Column(name = "Email", nullable = false)
    private String email;

    @Column(name = "Cellphone", nullable = false)
    private Integer cellphone;

    @Column(name = "FirstName", nullable = false)
    private String firstName;

    @Column(name = "LastName", nullable = false)
    private String lastName;

    @Column(name = "Role", nullable = false)
    private String role;

    @Column(name = "avatar", nullable = false)
    private String avatar;

    @Column(name = "DateOfBirth", nullable = false)
    private Date dateOfBirth;

    @Column(name = "Active", nullable = false)
    private Integer active;

    @Column(name = "addressID", nullable = false)
    private Integer addressID;


    @Column(name = "Password")
    private String password;

}
