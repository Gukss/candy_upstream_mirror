package com.project.candy.beer.service;

import com.project.candy.beer.dto.ReadBeerDetailResponse;
import com.project.candy.beer.dto.ReadBeerListResponse;
import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.calendar.entity.Calendar;
import com.project.candy.calendar.repository.CalendarRepository;
import com.project.candy.country.dto.ReadCountryResponse;
import com.project.candy.country.entity.Country;
import com.project.candy.country.repository.CountryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.likes.dto.ReadLikesListByUserResponse;
import com.project.candy.likes.entity.Likes;
import com.project.candy.likes.repository.LikesRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
  private final CalendarRepository calendarRepository;
  private final LikesRepository likeRepository;

  @Override
  public ReadBeerDetailResponse readBeerDetail(Long beerId, String userEmail) {
    // 상세 정보에 들어갈 맥주 정보
    Beer beer = beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage());
    // 상세 정보에 들어갈 나라 정보 (한글/영문 이름, 이미지 url)
    //todo: 예외 메시지 바꾸기
    Country foundCountry = countryRepository.findById(beer.getCountry().getId()).orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));
    ReadCountryResponse readCountryResponse = ReadCountryResponse.entityToDTO(foundCountry);
    // 위 두 정보를 리턴 DTO에 넣어준다.
    ReadBeerDetailResponse readBeerDetailResponse = ReadBeerDetailResponse.EntityToDTO(beer, readCountryResponse);

    // 현재 요청을 보낸 사용자가 해당 맥주를 마셨는지, 찜했는지 판단하기 위해 사용자 정보를 불러온다.
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());

    boolean isDrink = false;
    boolean isLike = false;

    // 마셨는지, 찜한 맥주인지 체크한다.
    List<Calendar> calendarList = calendarRepository.findByUserId(user.getId()).get();
    if (calendarList != null) {
      isDrink = true;
    }
    log.info(String.valueOf(user.getId()));
    log.info(String.valueOf(beer.getId()));
    Likes likes = likeRepository.readByUserAndBeerAndIsDeleteFalse(user.getId(), beer.getId());
    if (likes != null) {
      isLike = true;
    }

    // 마셨는지, 찜했는지에 대한 변수 업데이트
    readBeerDetailResponse.setDrinkAndLike(isDrink, isLike);

    return readBeerDetailResponse;
  }

  @Override
  public List<ReadBeerListResponse> readAllBeerList(String userEmail) {

    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    List<ReadBeerListResponse> beerList = beerRepository.readAllBeerList(user.getId());

    return beerList;
  }
}
