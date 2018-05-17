package com.ishopmall.controller.user;

import com.ishopmall.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

/**
 * 用户注销登录操作
 * @author JAM
 */
@Controller
public class UserLogout {
    @RequestMapping("/logout")
    public String logout(@ModelAttribute("User")User user, SessionStatus sessionStatus, HttpSession session){
        //@ModelAttribute("User")相当于将session中名为"User"的对象注入user对象中
        //sessionStatus中的setComplete方法可以将session中的内容全部清空,不会注销移除对象
        session.removeAttribute("User");
        sessionStatus.setComplete();
        user=null;
        System.gc();
        return "message/logout";
    }
}
