package com.project.candy.cache.entity;

import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.annotation.Id;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.cache.entity
 * fileName       : StyleCache
 * date           : 2023-03-27
 * description    :
 */
@RedisHash(value = "style")
public class StyleCache implements Serializable {

  @Id
  private long userId;

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

}
