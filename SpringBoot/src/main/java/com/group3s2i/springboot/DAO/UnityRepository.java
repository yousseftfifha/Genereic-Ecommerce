package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Unity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UnityRepository extends JpaRepository<Unity, Long> {
}