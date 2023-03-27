package com.project.candy.review.repository;


import com.project.candy.review.entity.Review;
import com.project.candy.review.entity.ReviewLike;
import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.review.repository
 * fileName       : ReviewLikeRepository
 * date           : 2023-03-25
 * description    : Review like 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface ReviewLikeRepository extends JpaRepository<ReviewLike, Long> {

  /**
   * 유저와 리뷰객체를 기반으로 DB에서 좋아요가 추가된 ReviewLike 객체를 찾는 메소드
   * @param user
   * @param review
   * @return
   */

  Optional<ReviewLike> findByUserAndReview(User user, Review review);

  /**
   * desc : 해당 리뷰의 좋아요 개수를 구하기 위한 메소드
   * @param review
   * @return
   */
  List<ReviewLike> findAllByReview(Review review);
 }
