package com.project.candy.user.entity;

import com.project.candy.user.dto.CreatePreferenceRequest;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * packageName    : com.project.candy.user.entity fileName       : Preference date           :
 * 2023-03-28 description    :
 */
@Entity
@Table(name = "preference")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
@ToString
public class Preference extends BaseTimeEntity {
  @Id
  @Column(name = "preference_id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  private int appearance;

  private int mouthfeel;

  private int flavor;

  private int aroma;

  @OneToOne
  @JoinColumn(name = "user_id")
  @NotNull
  private User user;

  @Embedded
  @NotNull
  private BaseEntity baseEntity;

  public static Preference create(User user, CreatePreferenceRequest createPreferenceRequest){
      Preference preference=Preference.builder()
          .user(user)
          .appearance(createPreferenceRequest.getAppearance())
          .aroma(createPreferenceRequest.getAroma())
          .flavor(createPreferenceRequest.getFlavor())
          .mouthfeel(createPreferenceRequest.getMouthfeel())
          .baseEntity(BaseEntity.builder()
              .constructor(user.getEmail())
              .isDelete(false)
              .updater(user.getEmail())
              .build())
          .build();

      return preference;
  }
}
