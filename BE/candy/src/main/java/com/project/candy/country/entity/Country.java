package com.project.candy.country.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.country.entity
 * fileName       : Country
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "country")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class Country extends BaseTimeEntity {

    @Id
    @Column(name = "country_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String countryKrName;;

    @NotBlank
    private String countryEnName;;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}