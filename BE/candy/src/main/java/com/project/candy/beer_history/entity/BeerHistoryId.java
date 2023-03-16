package com.project.candy.beer_history.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.beer_history.entity
 * fileName       : BeerHistoryId
 * date           : 2023-03-15
 * description    : beer_history 테이블의 복합키 관계를 풀기위한 클래스
 */
@Embeddable
public class BeerHistoryId implements Serializable {

    private long userId;
    private long beerId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BeerHistoryId that = (BeerHistoryId) o;

        if (userId != that.userId) return false;
        return beerId == that.beerId;
    }

    @Override
    public int hashCode() {
        int result = (int) (userId ^ (userId >>> 32));
        result = 31 * result + (int) (beerId ^ (beerId >>> 32));
        return result;
    }
}
