package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Supplies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author tfifha youssef
 */
@Repository
public interface SuppliesRepository extends JpaRepository<Supplies,Long> {
}
