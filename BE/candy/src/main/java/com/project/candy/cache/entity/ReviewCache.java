package com.project.candy.cache.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.cache.entity
 * fileName       : ReviewCache
 * date           : 2023-03-27
 * description    :
 */
@RedisHash(value = "review")
public class ReviewCache implements Serializable {

  @Id
  private long userId;
}
