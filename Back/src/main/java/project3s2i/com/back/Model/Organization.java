package project3s2i.com.back.Model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
@Getter
@Setter
@ToString
@Entity
@Table(name = "organization")
public class Organization implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private Integer name;

    @Column(name = "fiscalCode", nullable = false)
    private Integer fiscalCode;

    @Column(name = "patentcode", nullable = false)
    private Integer patentcode;

    @Column(name = "legalStatus", nullable = false)
    private Integer legalStatus;

    @Column(name = "category", nullable = false)
    private String category;

    @Column(name = "finality", nullable = false)
    private String finality;

    @Column(name = "size", nullable = false)
    private String size;

    @Column(name = "sector", nullable = false)
    private String sector;

    @Column(name = "scope", nullable = false)
    private String scope;

}
