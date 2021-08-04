package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Address;
import com.group3s2i.springboot.Model.AddressCustomer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AddressCustomerRepository extends JpaRepository<AddressCustomer, Long>{
    @Query("select a from AddressCustomer a where a.customer.id = ?1")
    List<Address> findByCustomerId(Long id);

    @Query("select distinct a from AddressCustomer a where a.customer.id = ?1 and a.type = ?2")
    Address findDistinctFirstByCustomerIdAndTypeEquals(Long id,String type);

}