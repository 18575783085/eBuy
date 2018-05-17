package com.ishopmall.controller.usercenter;

import com.ishopmall.exception.user.RegisterException;
import com.ishopmall.model.User;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.MD5Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * 用于个人信息修改密码
 */
@Controller
@RequestMapping("/usercenter")
public class password {
    @Autowired
    private UserService userService;
    /**
     * 修改密码中原密码校验
     * @param request
     * @param response
     * @throws IOException
     */
    /**
     * 前台校验原密码是否错误
     * @param request
     * @param response
     * @throws IOException
     */
	@RequestMapping("/checkPassword.do")
	public void checkPassword(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String oldPassword = request.getParameter("oldPassword");
		String password = request.getParameter("password");
		oldPassword = MD5Utils.md5(oldPassword);
		if(!oldPassword.equals(password)){
			response.getWriter().write("<font style='color:red'>原密码错误</font>");
		}
	}
	/**
	 * 
	 * @param oldPassword 原密码
	 * @param newPassword 新输入的密码
	 * @param newPassword2 确认密码
	 * @param request
	 * @return
	 * @throws RegisterException
	 */
	@RequestMapping("/passwordreplace")
    public String replace(String oldPassword, String newPassword, String newPassword2,HttpServletRequest request) throws RegisterException{
		//非空校验
		if(JudgeTools.isNull(oldPassword)){
        	return "redirect:/usercenter/password";
        }
        String password = request.getParameter("password");
        oldPassword = MD5Utils.md5(oldPassword);
        if(!oldPassword.equals(password)){
        	return "forward:/usercenter/showError";
        }
        if(JudgeTools.isNull(newPassword)){
        	return "redirect:/usercenter/password";
        }
        if(JudgeTools.isNull(newPassword2)){
        	return "redirect:/usercenter/password";
        }
        if(!newPassword.equals(newPassword2)){
        	return "forward:/usercenter/showError2";
        }
        newPassword = MD5Utils.md5(newPassword);
        User user = (User) request.getSession().getAttribute("User");
        user.setUserPassword(newPassword);
        String username = request.getParameter("username");
        userService.updatePassword(newPassword, username);
		return "usercenter/passwordreplace";
    }
	/**
	 * 为前台页面返回密码错误的提示
	 * @return
	 */
	@RequestMapping("showError")
	public ModelAndView showError(){
		String Error = "原密码错误";
		return new ModelAndView("/usercenter/password","checkError",Error);
	}
	/**
	 * 为前台页面返回两次密码那不一致的错误提示
	 * @return
	 */
	@RequestMapping("showError2")
	public ModelAndView showError2(){
		String Error = "两次密码不一致";
		return new ModelAndView("/usercenter/password","checkError",Error);
	}
	
}
