package com.ishopmall.utils;

import org.junit.Test;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * 进行检验数据合法性的工具类
 */
public class JudgeTools {
    /**
     * 数据非空校验
     *
     * @param str 传入参数
     * @return 如果是空则返回true, 不是空则返回false
     */
    public static boolean isNull(String str) {
        boolean result = str == null || "".equals(str);
        return result;
    }

    /**
     * 检验邮箱格式
     *
     * @param str
     * @return
     */
    public static boolean checkEmail(String str) {
        String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        if (str.matches(em)) {
            return true;
        }
        return false;
    }

    /**
     * 检验手机号码格式
     *
     * @param str
     * @return
     */
    public static boolean checkTel(String str) {
        String ph = "^[1][34578]\\d{9}$";
        if (str.matches(ph)) {
            return true;
        }
        return false;
    }

    /**
     * 检验用户地址
     *
     * @param str
     * @return
     */
    public static boolean checkAddress(String str) {
        //TODO 等待个人中心完善
        return true;
    }

    /**
     * 设置cookie
     * @param name
     * @param value
     * @param request
     * @param response
     * @param max
     * @return
     */
    public Cookie setCookie(String name, String value, HttpServletRequest request, HttpServletResponse response, int max) {
        try {
            //将用户名进行url编码之后再存入cookie中
            Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
            cookie.setMaxAge(max);
            cookie.setPath(request.getContextPath()+"/");
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
