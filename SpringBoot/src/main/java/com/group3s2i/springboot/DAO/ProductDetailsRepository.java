package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.ProductDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDetailsRepository extends JpaRepository<ProductDetails,Long> {
}
