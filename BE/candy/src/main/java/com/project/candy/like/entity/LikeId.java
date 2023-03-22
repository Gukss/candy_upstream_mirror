package com.project.candy.like.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.like.entity
 * fileName       : LikeId
 * date           : 2023-03-15
 * description    : like 테이블의 복합키 관계를 풀기위한 클래스
 */
@Embeddable
public class LikeId implements Serializable {

    @Column(name = "user_id")
    private long userId;

    @Column(name = "beer_id")
    private long beerId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LikeId likeId = (LikeId) o;

        if (userId != likeId.userId) return false;
        return beerId == likeId.beerId;
    }

    @Override
    public int hashCode() {
        int result = (int) (userId ^ (userId >>> 32));
        result = 31 * result + (int) (beerId ^ (beerId >>> 32));
        return result;
    }

    public LikeId() {
    }

    public LikeId(long userId, long beerId) {
        this.userId = userId;
        this.beerId = beerId;
    }
}
