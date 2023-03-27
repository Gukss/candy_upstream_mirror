package com.project.candy.cache.repository;

import com.project.candy.cache.entity.CandyCache;
import org.springframework.data.repository.CrudRepository;

/**
 * packageName    : com.project.candy.cache.repository
 * fileName       : CacheRepository
 * date           : 2023-03-27
 * description    :
 */
public interface CandyCacheRepository extends CrudRepository<CandyCache, Long> {
}
