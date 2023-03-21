package com.project.candy.user.service;

import com.project.candy.exception.exceptionMessage.DuplicatedExceptionsMessage;
import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
class UserServiceImplTest {

  UserService userService;

  // Test 협력자
  @MockBean
  UserRepository userRepository;

  @BeforeEach
  void setUp(){
    userService = new UserServiceImpl(userRepository);
  }

  @Test
  @DisplayName("유저 생성 , 중복 테스트")
  void createUserTest() {
    // given
//    CreateUserRequest createUserRequest1 = new CreateUserRequest();
//    ReflectionTestUtils.setField(createUserRequest1, "email", "a@naver.com");
//    ReflectionTestUtils.setField(createUserRequest1, "nickname", "현호몬");
//    ReflectionTestUtils.setField(createUserRequest1, "gender", "남");
//    ReflectionTestUtils.setField(createUserRequest1, "birth", LocalDate.now());
//    System.out.println("첫번째 테스트 이메일 : "+createUserRequest1.getBirth());
//    CreateUserRequest createUserRequest2 = new CreateUserRequest();
//    ReflectionTestUtils.setField(createUserRequest2, "email", "a@naver.com");
//    ReflectionTestUtils.setField(createUserRequest2, "nickname", "현호몬몬");
//    ReflectionTestUtils.setField(createUserRequest2, "gender", "여");
//    ReflectionTestUtils.setField(createUserRequest2, "birth", LocalDate.now());
//    System.out.println("두번째 테스트 이메일 : "+createUserRequest2.getEmail());


    // when
//    boolean a = userService.CreateUser(createUserRequest1);
//    System.out.println("현재 email로 찾기 값 : "+ userRepository.findByEmail(createUserRequest1.getEmail()).toString() );
//    System.out.println("현재 결과값 : "+ a );
//


    // then
//    Assertions.assertThat(userService.CreateUser(createUserRequest2)).isFalse();


  }
  
  @Test
  @DisplayName("유저 찾기 실패와 성공 모두 테스트")
  void findUserByEmailTest() {
    // given
//    CreateUserRequest createUserRequest = new CreateUserRequest();
//    ReflectionTestUtils.setField(createUserRequest, "email", "a@naver.com");
//    ReflectionTestUtils.setField(createUserRequest, "nickname", "현호몬");
//    ReflectionTestUtils.setField(createUserRequest, "gender", "남");
//    ReflectionTestUtils.setField(createUserRequest, "birth", LocalDate.now());
//    String email = "";
    
    // when

    // then

  }
}