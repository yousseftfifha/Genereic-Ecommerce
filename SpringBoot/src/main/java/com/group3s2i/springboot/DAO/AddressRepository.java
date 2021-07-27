package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AddressRepository extends JpaRepository<Address, Long>{
    @Query("select a from Address a where a.customer.id = ?1")
    List<Address> findByCustomerId(Long id);

    @Query("select distinct a from Address a where a.customer.id = ?1 and a.type = ?2")
    Address findDistinctFirstByCustomerIdAndTypeEquals(Long id,String type);

}