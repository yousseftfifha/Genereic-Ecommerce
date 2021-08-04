package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.ProductExtraCost;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author tfifha youssef
 */
@Repository
public interface ProductExtraCostRepository extends JpaRepository<ProductExtraCost,Long> {
}
