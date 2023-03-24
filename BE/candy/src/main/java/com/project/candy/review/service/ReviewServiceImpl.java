package com.project.candy.review.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.review.dto.ReadReviewResponse;
import com.project.candy.review.entity.Review;
import com.project.candy.review.repository.ReviewRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import java.util.List;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.review.service fileName       : ReviewServiceImpl date :
 * 2023-03-22 description    : Review 정보를 다루는 Service의 구현체
 */
@Service
@Transactional(readOnly = true)
@Slf4j
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

  private final BeerRepository beerRepository;
  private final UserRepository userRepository;
  private final ReviewRepository reviewRepository;

  @Override
  @Transactional
  // 하나의 맥주에 대해 사용자는 하나의 리뷰만 만들 수 있다.
  public boolean CreateReview(long beerId, CreateReviewRequest createReviewRequest) {
    User user=userRepository.findByEmail(createReviewRequest.getUserEmail())
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    Beer beer=beerRepository.findById(beerId)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

    List<Review> review=reviewRepository.findAllByUser(user);

    // 해당 아이디로 작성된 review 데이터가 없거나 삭제된 경우에만 리뷰를 추가 할 수 있다.
    if(review.size()==0 || review.get(0).getBaseEntity().isDelete()){
      reviewRepository.save(Review.create(user, beer, createReviewRequest));
      return true;
    }
    return false;
  }

  @Override
  public List<ReadReviewResponse> ReadAllReview(long beerId) {
    Beer beer = beerRepository.findById(beerId)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

    List<ReadReviewResponse> reviewList =reviewRepository.findAllByBeer(beer).stream().map(review -> {

      long userId=review.getUser().getId();
      User user=userRepository.findById(userId)
          .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

      ReadReviewResponse response=ReadReviewResponse.EntityToDto(user,review);

      return response;
    }).collect(Collectors.toList());

    return reviewList;
  }


}
