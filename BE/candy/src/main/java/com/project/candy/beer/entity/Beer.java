package com.project.candy.beer.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.*;

/**
 * packageName    : com.project.candy.beer.entity
 * fileName       : Beer
 * date           : 2023-03-15
 * description    : Beer Entity Class.
 */
@Entity
public class Beer extends BaseTimeEntity {

    @Id
    @Column(name = "beer_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String barcode;

    private String beerKrName;

    private String beerEnName;

    private String style;

    private double abv;

    private double flavor;

    private double mouthfeel;

    private double appearance;

    private double aroma;

    private double overall;

    @Embedded
    private BaseEntity baseEntity;
}