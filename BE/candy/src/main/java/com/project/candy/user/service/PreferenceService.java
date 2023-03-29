package com.project.candy.user.service;

import com.project.candy.user.dto.CreatePreferenceRequest;
import java.util.Optional;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : PreferenceService
 * date           : 2023-03-29
 * description    : 맥주 선호도 정보를 다루는 PreferenceService 인터페이스
 */

public interface PreferenceService {
  void CreatePreference(String email, CreatePreferenceRequest createPreferenceRequest);
}
