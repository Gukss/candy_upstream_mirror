package com.project.candy.exception;

import lombok.Builder;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * packageName    : com.project.candy.exception
 * fileName       : ControllerAdvisor
 * date           : 2023-03-20
 * description    : 예외 처리를 위한 controllerAdvisor
 */
@RestControllerAdvice
@Builder
public class ControllerAdvisor {
  @ExceptionHandler(RuntimeException.class)
  @ResponseStatus(HttpStatus.NOT_FOUND)
  @ResponseBody
  public ExceptionResponse NotFoundExceptionHandler(Exception e, ServerHttpRequest request){
    return ExceptionResponse.createExceptionResponse(e, HttpStatus.BAD_REQUEST, request);
  }
}
