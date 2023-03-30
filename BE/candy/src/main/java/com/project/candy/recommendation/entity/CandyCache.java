package com.project.candy.recommendation.entity;

import com.project.candy.beer.entity.Beer;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.annotation.Id;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.recommendation.entity
 * fileName       : Candy
 * date           : 2023-03-27
 * description    :
 */
@RedisHash(value = "candy")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CandyCache implements Serializable {

  @Id
  private long id;

  private long userId;

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  public static CandyCache entityToCache(long id, long userId, Beer beer) {
    return CandyCache.builder()
            .id(id)
            .userId(userId)
            .beerId(beer.getId())
            .beerKrName(beer.getBeerKrName())
            .beerEnName(beer.getBeerEnName())
            .beerImageUrl(beer.getBeerImage())
            .build();
  }
}
