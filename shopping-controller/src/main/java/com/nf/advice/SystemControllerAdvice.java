package com.nf.advice;

import com.nf.vo.ResponseVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class SystemControllerAdvice {

    @ExceptionHandler(ArithmeticException.class)
    public String handleArithmeticException(ArithmeticException e) {
        return "error";
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseVO handlerRuntimeException(RuntimeException e){
        ResponseVO responseVO = ResponseVO.newBuilder().code("500").msg("运行时出现错误").build();
        return responseVO;
    }
}
