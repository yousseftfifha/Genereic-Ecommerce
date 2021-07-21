package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Mouvement;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tfifha youssef
 */
public interface MouvementRepository extends JpaRepository<Mouvement,Long> {
}
