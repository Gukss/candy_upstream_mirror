package com.project.candy.user.controller;

import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.dto.ReadUserByEmailResponse;
import com.project.candy.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


/**
 * packageName    : com.project.candy.user.controller
 * fileName       : UserController
 * date           : 2023-03-20
 * description    : User 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class UserController {

  private final UserService userService;

  /**
   * 프론트로부터 sign-up , 회원가입 요청을 처리하는 메소드
   *
   * @param createUserRequest
   * @return
   */
  @PostMapping(path = "sign-up", headers = "email")
  public ResponseEntity<?> createUser(@RequestHeader("email") String userEmail, @RequestBody CreateUserRequest createUserRequest) {
    boolean return_value = userService.CreateUser(userEmail, createUserRequest);
    return new ResponseEntity<Boolean>(return_value, HttpStatus.OK);
  }

  /**
   * 한명의 Email을 헤더로 받으면,
   * 해당 유저의 nickName , profileImage 를 리턴
   *
   * @param userEmail
   * @return
   */
  @GetMapping(path = "user", headers = "email")
  public ResponseEntity<?> findUserByEmail(@RequestHeader("email") String userEmail) {
    return new ResponseEntity<ReadUserByEmailResponse>(userService.readUserByEmail(userEmail), HttpStatus.OK);
  }

}
