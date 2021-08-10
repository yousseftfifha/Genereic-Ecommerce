package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Mouvement;
import com.group3s2i.springboot.Model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author tfifha youssef
 */
public interface MouvementRepository extends JpaRepository<Mouvement,Long> {
    List<Mouvement> findAllByProductOrderByIdAsc(Product product);

    @Query("SELECT AVG(m.unitPrice) FROM Mouvement m where m.product=?1")
    double avg(Product product);

    @Query("SELECT SUM (m.unitPrice) FROM Mouvement m where m.typeMouvement='OUT' ")
    double earning();

    @Query("select count(m) from Mouvement m where m.typeMouvement = 'IN'")
    Long countAllByTypeMouvementEqualsIN();

    @Query("select count(m) from Mouvement m where m.typeMouvement = 'OUT'")
    Long countAllByTypeMouvementEqualsOUT();

}


