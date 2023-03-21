package com.project.candy.calendar.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.calendar.entity
 * fileName       : Calendar
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "calendar")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class Calendar extends BaseTimeEntity {

    @Id
    @Column(name = "calendar_id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @NotBlank
    private User user;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}
