package com.project.candy.country.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import javax.persistence.*;

/**
 * packageName    : com.project.candy.country.entity
 * fileName       : Country
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class Country extends BaseTimeEntity {

    @Id
    @Column(name = "country_id")
    private long id;

    private String countryKrName;;

    private String countryEnName;;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contry_image_id")
    private CountryImage countryImage;

    @Embedded
    private BaseEntity baseEntity;
}