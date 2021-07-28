package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Category;
import com.group3s2i.springboot.Model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product>{

    @Query("select p from Product p where p.category = ?1")
    Optional<List<Product>> findByCategory(Category id);
    @Query("SELECT p FROM Product p WHERE CONCAT(p.name, p.brand, p.category.name) LIKE %?1%")
    List<Product> search(String keyword);

    @Query("select p from Product p WHERE CONCAT(p.name, p.brand, p.category.name) LIKE %?1%")
    List<Product> findAllByNameOrBrandOrCategoryName(String key);

}