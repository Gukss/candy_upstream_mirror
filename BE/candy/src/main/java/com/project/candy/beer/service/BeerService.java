package com.project.candy.beer.service;

import com.project.candy.beer.dto.ReadBeerDetailResponse;
import com.project.candy.beer.entity.Beer;
import java.util.List;

/**
 * packageName    : com.project.candy.beer.service
 * fileName       : BeerService
 * date           : 2023-03-20
 * description    : BeerService
 */
public interface BeerService {

  /**
   * desc : 맥주 상세 조회
   *
   * @param beerId
   * @param userEmail
   * @return
   */
  ReadBeerDetailResponse readBeerDetail(Long beerId, String userEmail);

  /**
   * desc : 맥주 리스트 조회 (도감용)
   * @return 모든 맥주 리스트 리턴 (단, 마신건지, 찜한건지 변수 필요)
   */
  List<Beer> readAllBeerList();
}