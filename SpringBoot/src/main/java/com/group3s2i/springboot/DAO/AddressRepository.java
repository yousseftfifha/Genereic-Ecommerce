package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, Long> {
}