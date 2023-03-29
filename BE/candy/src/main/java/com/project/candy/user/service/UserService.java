package com.project.candy.user.service;

import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.dto.ReadUserByEmailResponse;
import com.project.candy.user.entity.User;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : UserService
 * date           : 2023-03-20
 * description    : User 정보를 다루는 Service의 인터페이스
 */


public interface UserService {

  /**
   * desc : sign-up , 회원가입 시  프론트로부터 DTO룰 받아
   * User 테이블에 값을 저장하는 메소드.
   * email 중복을 확인하여 , 중복된 값이면 false
   * 아니면 true를 리턴한다.
   *
   * @param createUserRequest
   * @return
   */
  public Boolean CreateUser(String userEmail, CreateUserRequest createUserRequest);

  /**
   * desc : 다른 클래스에서 Email 로 User 객체를 리턴해주는 메소드
   *
   * @param Email
   * @return
   */
  public User findUserByEmail(String Email);

  /**
   * desc : userEmail 을 인자로 받으면 Dto를 리턴해주는 메소드
   *
   * @param userEmail
   *
   * @return
   */
  public Boolean readUserByEmail(String userEmail);

}
