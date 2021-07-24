package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Product;
import com.group3s2i.springboot.Model.Supplies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * @author tfifha youssef
 */
@Repository
public interface SuppliesRepository extends JpaRepository<Supplies,Long> {
    @Query("select s from Supplies s where s.product = ?1")
    Supplies findByProduct(Optional<Product> product);
}
