package com.project.candy.beer_history.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * packageName    : com.project.candy.beer_history.entity
 * fileName       : BeerHistory
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "beer_history")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class BeerHistory extends BaseTimeEntity {

    @EmbeddedId
    private BeerHistoryId beerHistoryId;

    // TODO : 복합키 공부가 필요하다.

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @NotNull
    private User user;

    @MapsId("beerId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    @NotNull
    private Beer beer;

    @NotNull
    private int count; // 맥주 마신 횟수

    @Embedded
    @NotNull
    private BaseEntity baseEntity;

    /**
     *  desc : 이미 맥주가 있을때
     *  count 값을 증가시키는 메소드
     */
    public void updateCount(){
        this.count+=1;
    }

}