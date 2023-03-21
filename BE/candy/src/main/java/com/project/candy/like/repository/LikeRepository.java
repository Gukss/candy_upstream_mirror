package com.project.candy.like.repository;

import com.project.candy.like.entity.Like;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * packageName    : com.project.candy.like.repository
 * fileName       : LikeRepository
 * date           : 2023-03-21
 * description    :
 */
public interface LikeRepository extends JpaRepository<Like, Long> {

  Optional<Like> readLikeSelectedByUser(Long beerId, long id);
}
