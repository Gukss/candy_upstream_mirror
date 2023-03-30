package com.project.candy.recommendation.entity;

import org.springframework.data.redis.core.RedisHash;
import org.springframework.data.annotation.Id;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.recommendation.entity
 * fileName       : StyleCache
 * date           : 2023-03-27
 * description    :
 */
@RedisHash(value = "style")
public class SimilarityCache implements Serializable {

  @Id
  private long userId;

  private long beerId;

}
