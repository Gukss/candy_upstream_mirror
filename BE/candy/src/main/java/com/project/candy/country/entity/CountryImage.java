package com.project.candy.country.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * packageName    : com.project.candy.country.entity
 * fileName       : CountryImage
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class CountryImage extends BaseTimeEntity {

    @Id
    @Column(name = "country_image_id")
    private long id;

    @Column(length = 511)
    private String countryImageUrl;

    @Embedded
    private BaseEntity baseEntity;
}
