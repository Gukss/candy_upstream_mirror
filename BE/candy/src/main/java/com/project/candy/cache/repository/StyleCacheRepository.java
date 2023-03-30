package com.project.candy.cache.repository;

import com.project.candy.recommendation.entity.SimilarityCache;
import org.springframework.data.repository.CrudRepository;

/**
 * packageName    : com.project.candy.cache.repository
 * fileName       : StyleCacheRepository
 * date           : 2023-03-27
 * description    :
 */
public interface StyleCacheRepository extends CrudRepository<SimilarityCache, Long> {
}
