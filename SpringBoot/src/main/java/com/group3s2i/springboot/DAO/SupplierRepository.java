package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author tfifha youssef
 */
@Repository
public interface SupplierRepository extends JpaRepository<Supplier,Long> {
}
