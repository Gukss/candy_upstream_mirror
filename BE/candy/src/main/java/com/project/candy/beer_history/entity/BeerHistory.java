package com.project.candy.beer_history.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseTimeEntity;
import javax.persistence.*;

/**
 * packageName    : com.project.candy.beer_history.entity
 * fileName       : BeerHistory
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "bear_history")
public class BeerHistory extends BaseTimeEntity {

    @EmbeddedId
    private BeerHistoryId beerHistoryId;

    // TODO : 복합키 공부가 필요하다.

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User userId;

    @MapsId("beerId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    private Beer beerId;

    private int count; // 맥주 마신 횟수
}