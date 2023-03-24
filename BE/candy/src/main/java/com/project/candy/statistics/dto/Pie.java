package com.project.candy.statistics.dto;

import lombok.Getter;

/**
 * packageName    : com.project.candy.statistics.dto fileName       : Pie date           :
 * 2023-03-24 description    :
 */
@Getter
public class Pie{
  private String name;
  private double value;

  public Pie(String name, double value) {
    this.name = name;
    this.value = value;
  }
}
