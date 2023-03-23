package com.project.candy.calendar.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @NotNull
    private User user;

    @Embedded
    @NotNull
    private BaseEntity baseEntity;
}
