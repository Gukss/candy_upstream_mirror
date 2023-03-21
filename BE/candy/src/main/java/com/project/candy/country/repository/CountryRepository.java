package com.project.candy.country.repository;

import com.project.candy.country.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * packageName    : com.project.candy.country.repository
 * fileName       : CountryRepository
 * date           : 2023-03-21
 * description    :
 */
public interface CountryRepository extends JpaRepository<Country, Long> {
}
