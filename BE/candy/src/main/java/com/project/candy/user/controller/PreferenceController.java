package com.project.candy.user.controller;

import com.project.candy.user.dto.CreatePreferenceRequest;
import com.project.candy.user.service.PreferenceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.project.candy.user.controller
 * fileName       : PreferenceController
 * date           : 2023-03-29
 * description    : Preference 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/preference")
@RequiredArgsConstructor
public class PreferenceController {
  private final PreferenceService preferenceService;
  @PostMapping(path = "", headers = "email")
  public ResponseEntity<?> createPreference(@RequestHeader("email") String userEmail, @RequestBody CreatePreferenceRequest createPreferenceRequest) {
    preferenceService.CreatePreference(userEmail,createPreferenceRequest);
    return new ResponseEntity<>(HttpStatus.OK);
  }
}
