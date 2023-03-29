package com.project.candy.user.service;

import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.user.dto.CreatePreferenceRequest;
import com.project.candy.user.entity.Preference;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.PreferenceRepository;
import com.project.candy.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : PreferenceServiceImpl
 * date           : 2023-03-29
 * description    : 맥주 선호도 정보를 다루는 PreferenceService 구현체
 */
@Service
@Transactional(readOnly = true)
@Slf4j
@RequiredArgsConstructor
public class PreferenceServiceImpl implements PreferenceService{

  private final UserRepository userRepository;
  private final PreferenceRepository preferenceRepository;
  @Override
  @Transactional
  public void CreatePreference(String email, CreatePreferenceRequest createPreferenceRequest) {
    User user=userRepository.findByEmail(email)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    Preference preference=Preference.create(user,createPreferenceRequest);

    preferenceRepository.save(preference);

  }
}
