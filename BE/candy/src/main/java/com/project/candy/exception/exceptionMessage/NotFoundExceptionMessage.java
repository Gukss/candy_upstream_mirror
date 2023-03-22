package com.project.candy.exception.exceptionMessage;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;
/**
 * packageName    : com.project.candy.exception.exceptionMessage
 * fileName       : NotFoundBeerException
 * date           : 2023-03-20
 * description    : beer 객체가 없을 때 반환하는 예외
 */
public class NotFoundExceptionMessage extends RuntimeException{
  public static final String NOT_FOUND_BEER = "존재하지 않는 맥주입니다.";
  public static final String NOT_FOUND_USER = "존재하지 않는 회원입니다.";
  public NotFoundExceptionMessage() {
    super();
  }

  public NotFoundExceptionMessage(String message) {
    super(message);
  }
}
