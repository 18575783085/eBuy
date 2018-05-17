package com.ishopmall.controller.user;

import com.ishopmall.model.User;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户登录控制器，用于用户进行手机或者邮箱进行登录
 * @author JAM
 * 2017年11月17日12:21:05
 */
@Controller
@SessionAttributes({"User"})
public class UserLogin {
    @Autowired
    private UserService userService;
    @RequestMapping("/logining")
    public String login(String username, String password, HttpSession session, Model model) {
        //判断是邮箱还是手机号的正则表达式
        String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        String ph = "^[1][34578]\\d{9}$";
        Subject subject = SecurityUtils.getSubject();
        //创建用户名和密码的令牌
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        //邮箱登录方式
        try {
                //把token传入安全中心进行判断
                subject.login(token);
                //取回对象
                User user= (User) subject.getPrincipal();
                model.addAttribute("User",user);
                return "redirect:index.jsp";
                //电话登录方式
        }
        catch (AuthenticationException e){
            e.printStackTrace();
            return "message/logError";
        }
    }
}
