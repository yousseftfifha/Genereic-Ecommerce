package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Cart;
import com.group3s2i.springboot.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {
}
