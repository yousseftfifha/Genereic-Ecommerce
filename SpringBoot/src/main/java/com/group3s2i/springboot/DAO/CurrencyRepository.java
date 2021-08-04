package com.group3s2i.springboot.DAO;

import com.group3s2i.springboot.Model.Currency;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CurrencyRepository extends JpaRepository<Currency, Long> {
}