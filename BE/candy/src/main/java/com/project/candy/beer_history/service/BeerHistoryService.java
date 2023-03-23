package com.project.candy.beer_history.service;


/**
 * packageName    : com.project.candy.beer_history.service
 * fileName       : BeerHistoryService
 * date           : 2023-03-23
 * description    : 음주 도감을 위한 서비스 인터페이스
 */
public interface BeerHistoryService {
  /**
   * userEmail 과 beerId를 이용하여 beerHistory 생성
   * 중복된 값이 있을때는 count만 증가
   * @param userEmail
   * @param beerId
   */
  void createBeerHistory(String userEmail , Long beerId);
}
