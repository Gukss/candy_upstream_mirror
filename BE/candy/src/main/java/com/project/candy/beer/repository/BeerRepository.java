package com.project.candy.beer.repository;

import com.project.candy.beer.entity.Beer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * packageName    : com.project.candy.beer.repository
 * fileName       : BeerRepository
 * date           : 2023-03-20
 * description    : Beer repository
 */
@Repository
public interface BeerRepository extends JpaRepository<Beer, Long> {

}
