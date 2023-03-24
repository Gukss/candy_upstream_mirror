package com.project.candy.likes.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * packageName    : com.project.candy.like.entity
 * fileName       : Like
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "likes")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class Likes extends BaseTimeEntity {

    @EmbeddedId
    private LikesId likeId;

    @MapsId(value = "userId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @NotNull
    private User user;

    @MapsId(value = "beerId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    @NotNull
    private Beer beer;

    @Embedded
    @NotNull
    private BaseEntity baseEntity;
}
