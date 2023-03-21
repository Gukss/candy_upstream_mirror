package com.project.candy.beer.entity;

import com.project.candy.country.entity.Country;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.beer.entity
 * fileName       : Beer
 * date           : 2023-03-15
 * description    : Beer Entity Class.
 */
@Entity
@Table(name = "beer")
@Builder
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Beer extends BaseTimeEntity {

    @Id
    @Column(name = "beer_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String barcode;

    @NotBlank
    private String beerKrName;

    @NotBlank
    private String beerEnName;

    @NotBlank
    private String style;

    @NotBlank
    private double abv;

    @NotBlank
    private double flavor;

    @NotBlank
    private double mouthfeel;

    @NotBlank
    private double appearance;

    @NotBlank
    private double aroma;

    @NotBlank
    private double overall;

    @JoinColumn(name = "country_id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Country country;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}