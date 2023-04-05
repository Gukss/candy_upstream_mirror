package com.project.candy.beer.service;

import com.project.candy.beer.dto.ReadBeerAvgFromReviewResponse;
import com.project.candy.beer.dto.ReadBeerDetailResponse;
import com.project.candy.beer.dto.ReadBeerListResponse;
import com.project.candy.beer.dto.ReadSearchBeerListResponse;
import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.beer_history.entity.BeerHistory;
import com.project.candy.beer_history.repository.BeerHistoryRepository;
import com.project.candy.calendar.entity.Calendar;
import com.project.candy.calendar.repository.CalendarRepository;
import com.project.candy.country.dto.ReadCountryResponse;
import com.project.candy.country.entity.Country;
import com.project.candy.country.repository.CountryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.likes.entity.Likes;
import com.project.candy.likes.repository.LikesRepository;
import com.project.candy.recommendation.entity.RecentlyCache;
import com.project.candy.recommendation.repository.RecommendationRepository;
import com.project.candy.review.entity.Review;
import com.project.candy.review.repository.ReviewRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * packageName    : com.project.candy.beer.service
 * fileName       : BeerServiceImpl
 * date           : 2023-03-20
 * description    :
 */
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class BeerServiceImpl implements BeerService {

  private final BeerRepository beerRepository;
  private final UserRepository userRepository;
  private final CountryRepository countryRepository;
  private final BeerHistoryRepository beerHistoryRepository;
  private final LikesRepository likeRepository;
  private final ReviewRepository reviewRepository;
  private final JdbcTemplate jdbcTemplate;
  private final RecommendationRepository recommendationRepository;

  @Override
  public ReadBeerDetailResponse readBeerDetail(Long beerId, String userEmail) {
    // 상세 정보에 들어갈 맥주 정보
    Beer beer = beerRepository.findById(beerId).orElseThrow(
            () -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));
    // 상세 정보에 들어갈 나라 정보 (한글/영문 이름, 이미지 url)
    //todo: 예외 메시지 바꾸기
    Country foundCountry = countryRepository.findById(beer.getCountry().getId())
            .orElseThrow(() -> new NotFoundExceptionMessage());
    ReadCountryResponse readCountryResponse = ReadCountryResponse.entityToDTO(foundCountry);
    // 위 두 정보를 리턴 DTO에 넣어준다.
    ReadBeerDetailResponse readBeerDetailResponse = ReadBeerDetailResponse.entityToDTO(beer, readCountryResponse);

    // 현재 요청을 보낸 사용자가 해당 맥주를 마셨는지, 찜했는지 판단하기 위해 사용자 정보를 불러온다.
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());

    boolean isDrink = false;
    boolean isLike = false;

    // 마셨는지, 찜한 맥주인지 체크한다.
    Optional<BeerHistory> history = beerHistoryRepository.findAllByUserAndBeer(user, beer);
    if (history.isPresent()) {
      isDrink = true;
    }

    Likes likes = likeRepository.readByUserAndBeerAndIsDeleteFalse(user.getId(), beer.getId());
    if (likes != null) {
      isLike = true;
    }

    // 마셨는지, 찜했는지에 대한 변수 업데이트
    readBeerDetailResponse.setDrinkAndLike(isDrink, isLike);

    // 캐시에 조회한 맥주의 정보를 저장한다. -> 메인페이지 비슷한 맥주 추천을 위해
    recommendationRepository.createRecentlyCache(user.getId(), RecentlyCache.entityToCache(beer));

    return readBeerDetailResponse;
  }

  @Override
  public List<ReadBeerListResponse> readAllBeerList(String userEmail) {

    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    List<ReadBeerListResponse> beerList = beerRepository.readAllBeerList(user.getId());

    return beerList;
  }

  @Override
  public List<ReadSearchBeerListResponse> readAllSearchBeerList(String beerName) {

    boolean isKorean = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", beerName);

    List<Beer> beerList = new ArrayList<>();
    if (isKorean) {
      beerList = beerRepository.findAllByBeerKrNameContaining(beerName);
    } //
    else {
      beerList = beerRepository.findAllByBeerEnNameContaining(beerName);
    }

    List<ReadSearchBeerListResponse> resBeerList = new ArrayList<>();
    for (Beer beer : beerList) {
      // todo : ReadSearchBeerListResponse entity to dto
      resBeerList.add(new ReadSearchBeerListResponse(
              beer.getId(), beer.getBeerKrName(), beer.getBeerEnName(), beer.getBeerImage()));
    }

    return resBeerList;
  }

  @Override
  public ReadBeerDetailResponse readBeerDetailByBarcode(String barcode, String userEmail) {

    Beer beer = beerRepository.findByBarcode(barcode).orElse(null);

    // 바코드가 없는 값이 있어 에러 처리를 하지않고 null처리
    // 바코드가 등록되지 않은 맥주가 있을 수 있다.
    // => 프론트에게 null 던져주면 처리할 수 있도록 했다.
    if (beer == null) {
      return null;
    }

    ReadBeerDetailResponse resBeerDetail = readBeerDetail(beer.getId(), userEmail);
    return resBeerDetail;
  }

  @Override
  @Scheduled(cron = "0 0 4 1/1 * *")
  @Transactional
  public void updateBeer() {

    // 1. 리뷰 테이블 row를 모두 가져온다.
    // 1-1. 단 삭제되지 않은 정보만 가져와야 한다.
    // 2. 모든 리뷰에서 연산할 값들을 연산해준다. -> roll up 쿼리로 해결
    // 3. JDBC Batch를 이용해 db에 한번에 업데이트 해준다.

    List<Review> reviewList = reviewRepository.readAllIsDeleteFalse();
    if (reviewList != null && !reviewList.isEmpty()) {

      // todo : DTO 검증 필요
      List<ReadBeerAvgFromReviewResponse> beerAvgList = beerRepository.readAllBeerAvgList();
      if (beerAvgList != null && !beerAvgList.isEmpty()) {
        batchUpdate(beerAvgList);
      }
    }
  }

  /**
   * updateBeer() 메소드에서 배치 처리를 위해 호출하는 메소드
   *
   * @param beerAvgList
   */
  public void batchUpdate(List<ReadBeerAvgFromReviewResponse> beerAvgList) {
    jdbcTemplate.batchUpdate("update beer set " +
                    "beer.aroma = ?, beer.flavor = ?, beer.mouthfeel = ?, " +
                    "beer.appearance = ?, beer.overall = ? where beer.beer_id = ?",
            beerAvgList,
            beerAvgList.size(),
            new ParameterizedPreparedStatementSetter<ReadBeerAvgFromReviewResponse>() {
              @Override
              public void setValues(PreparedStatement ps, ReadBeerAvgFromReviewResponse beerAvg) throws SQLException {
                ps.setDouble(1, beerAvg.getAromaAvg());
                ps.setDouble(2, beerAvg.getFlavorAvg());
                ps.setDouble(3, beerAvg.getMouthfeelAvg());
                ps.setDouble(4, beerAvg.getAppearanceAvg());
                ps.setDouble(5, beerAvg.getOverallAvg());
                ps.setLong(6, beerAvg.getBeerId());
              }
            });
  }
}
