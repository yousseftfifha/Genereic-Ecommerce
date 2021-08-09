package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Category;
import com.group3s2i.springboot.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    @Query("select c from Category c where c.parentId IS NULL")
    Optional<List<Category>> findByIdupEqualsNull();

    @Query("select c from Category c where c.parentId is not null")
    Optional<List<Category>> findByParentIdNotNull();

    @Query("select c from Category c where c.parentId = ?1")
    Optional<List<Category>>findByidup(Category parentId);


}