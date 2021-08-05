package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.ProductSupplier;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author tfifha youssef
 */
public interface ProductSupplierRepository extends JpaRepository<ProductSupplier,ProductSupplier.ProductSupplierId> {
}
