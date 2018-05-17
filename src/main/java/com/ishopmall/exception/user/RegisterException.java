package com.ishopmall.exception.user;

/**
 * 检验用户注册异常类
 */
public class RegisterException extends Exception {
    public RegisterException() {
    }

    public RegisterException(String msg) {
        super(msg);
    }
}
