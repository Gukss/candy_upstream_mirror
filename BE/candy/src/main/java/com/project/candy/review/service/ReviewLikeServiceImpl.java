package com.project.candy.review.service;


import com.project.candy.beer.entity.Beer;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.likes.entity.Likes;
import com.project.candy.likes.entity.LikesId;
import com.project.candy.review.entity.Review;
import com.project.candy.review.entity.ReviewLike;
import com.project.candy.review.repository.ReviewLikeRepository;
import com.project.candy.review.repository.ReviewRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.review.service
 * fileName       : ReviewLikeServiceImpl
 * date           : 2023-03-25
 * description    : ReviewLike 정보를 다루는 Service의 구현체
 */
@Service
@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ReviewLikeServiceImpl implements ReviewLikeService {

  private final ReviewRepository reviewRepository;

  private final UserRepository userRepository;

  private final ReviewLikeRepository reviewLikeRepository;

  /**
   * desc : 리뷰아이디와 유저이메일 기반으로 리뷰에 좋아요 추가
   * @param reviewId
   * @param userEmail
   */
  @Override
  @Transactional
  public void createLikeReview(Long reviewId, String userEmail) {

    // 찜하기를 누른 유저 정보
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    // 유저가 찜을 누른 맥주 정보
    Review review= reviewRepository.findById(reviewId).orElseThrow(() -> new NotFoundExceptionMessage());

    // 찜하기 정보 생성
    ReviewLike reviewLike = ReviewLike.builder()
            .user(user)
            .review(review)
            .baseEntity(BaseEntity.builder()
                    .constructor(user.getEmail())
                    .isDelete(false)
                    .updater(user.getEmail())
                    .build())
            .build();

    // 찜했다가 해제한 후 다시 찜하는 경우 고려
    // upsert 사용 필요
    ReviewLike createReviewLike = reviewLikeRepository.findByUserAndReview(user, review).orElse(reviewLike);
    if (createReviewLike.getBaseEntity().isDelete()) {
      createReviewLike.getBaseEntity().create();
      return;
    }
    // 찜하기 저장
    reviewLikeRepository.save(createReviewLike);
  }

  /**
   * desc : 리뷰아이디와 유저이메일 기반으로 리뷰에 좋아요 삭제
   * @param reviewId
   * @param userEmail
   */
  @Override
  @Transactional
  public void deleteLikeReview(Long reviewId, String userEmail) {

    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    Review review = reviewRepository.findById(reviewId).orElseThrow(() -> new NotFoundExceptionMessage());
    
    //todo : reviewLike 로 메소드 명 수정
    ReviewLike reviewLike = reviewLikeRepository.findByUserAndReview(user, review).orElseThrow(() -> new NotFoundExceptionMessage());
    // 삭제
    reviewLike.getBaseEntity().delete();
  }


}
