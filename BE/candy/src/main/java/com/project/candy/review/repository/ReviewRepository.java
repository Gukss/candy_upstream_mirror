package com.project.candy.review.repository;

import com.project.candy.review.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * packageName    : com.project.candy.review.repository
 * fileName       : ReviewRepository
 * date           : 2023-03-22
 * description    : Review 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface ReviewRepository extends JpaRepository<Review,Long> {

}
