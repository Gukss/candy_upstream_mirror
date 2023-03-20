package com.project.candy.country.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.country.entity
 * fileName       : CountryImage
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "country_image")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class CountryImage extends BaseTimeEntity {

    @Id
    @Column(name = "country_image_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(length = 511)
    @NotBlank
    private String countryImageUrl;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}
