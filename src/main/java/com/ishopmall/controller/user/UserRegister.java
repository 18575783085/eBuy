package com.ishopmall.controller.user;

import com.aliyuncs.exceptions.ClientException;
import com.ishopmall.exception.user.RegisterException;
import com.ishopmall.model.User;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.MD5Utils;
import com.ishopmall.utils.SendEmail;
import com.ishopmall.utils.VerifyCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 描述：
 * 用户注册控制器，包括邮箱注册和手机号注册
 *
 * @author JAM
 * @create 2017-11-10 21:52
 **/
@Controller
@RequestMapping("/register")
@SessionAttributes({"User"})
public class UserRegister {
	
    /**
	 * 短信总条数
	 */
	private static int message = 0;
	
	
    @Autowired
    private UserService userService;

    /**
     * 用于AJAX检验邮箱是否存在
     *
     * @param userEmail 用户输入邮箱
     * @return 返回是否存在提示
     */
    @RequestMapping("/selectEmail.do")
    public void SelectEmail(String userEmail, HttpServletResponse response) throws Exception {
        User user = new User();
        if (userEmail == null || userEmail.equals("")) {
            response.getWriter().write("<font style='color:red'>请输入用户邮箱地址</font>");
            return;
        }
        user.setUserEmail(userEmail);
        List<User> users = userService.selectUserExist(user);
        //非空判断
        if (users.isEmpty() || users == null) {
            response.getWriter().write("<font style='color:#339933'>恭喜你，可以使用该用户</font>");
        } else {
            response.getWriter().write("<font style='color:red'>此用户已经存在</font>");
        }
    }

    /**
     * 用于用户邮箱注册
     *
     * @param user     用户基本信息
     * @param userInfo 用户附属信息
     * @param model    模型
     * @return 返回到发送成功界面
     */
    @RequestMapping("/register.do")
    public String register(User user, UserInfo userInfo, String userPassword2, Model model,String valistr,HttpServletRequest request,HttpServletResponse response) {
        String email = user.getUserEmail();
        //随机生成一个UUID用于保存用户ID
        UUID uuid = UUID.randomUUID();
        String userid = uuid.toString();
        user.setUserId(userid);
        userInfo.setUserId(userid);
        //设置用户注册时间
        Date date = new Date();
        userInfo.setUserRegtime(date);
        //设置注册用户权限默认为user
        userInfo.setUserPermissions("user");
        //设置邮箱验证状态
        userInfo.setUserStatus(0);
        //设置邮箱验证码
        userInfo.setUserCode(MD5Utils.md5(email));
        //密码进行MD5加密
        try {
            if (JudgeTools.isNull(user.getUserEmail())) {
                model.addAttribute("checkError", "请输入邮箱地址");
                //跳转到错误页面
                return "message/ErrorRegister";
            }
            if (!userPassword2.equals(user.getUserPassword())) {
                model.addAttribute("checkError", "两次密码输入不一致");
                //跳转到错误页面
                return "message/ErrorRegister";
            }
            //防止浏览器禁止Ajax，在这里再判断一次图片验证码校验
            //获取保存在session的图片验证码
    		String code = (String) request.getSession().getAttribute("code");
    		//判断图片验证码是否匹配
    		if(!valistr.toLowerCase().equals(code.toLowerCase())){
    			model.addAttribute("checkError", "图片验证码输入不一致");
                //跳转到错误页面
                return "message/ErrorRegister";
    		}
            user.checkFormat();
        } catch (RegisterException e) {
            model.addAttribute("checkError", e.getMessage());
            //跳转到错误页面
            return "message/ErrorRegister";
        }
        user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
        //数据合法性检验
        boolean res = userService.resgisterUser(user, userInfo);
        if (res) {
//            //把用户基础信息保存到隐藏域
//            model.addAttribute("emailAddress", email);
//            model.addAttribute("useruid", user.getUserId());
//            model.addAttribute("code", userInfo.getUserCode());
//            return "message/ConfirmEmail";
			//true:注册成功
			List<User> userinfo = userService.selectUserLogin(user);
			User userLogin= userinfo.get(0);
			//添加用户信息自动登录session
			model.addAttribute("User", userLogin);
			return "message/SucRegister";
        }
        model.addAttribute("checkError", "你注册用户已存在，请勿重复注册");
        return "message/ErrorRegister";
    }

    /**（不要）
     * 用户点击重新发送邮件
     *
     * @param email  隐藏域邮件地址
     * @param userid 隐藏域uuid
     * @param code   隐藏域加密code值
     * @param model  视图
     * @return 再次返回发送页面
     */
    @RequestMapping("resendEmail.do")
    public String resendEmail(String email, String userid, String code, Model model) {
        //重发送邮件
        SendEmail.resendEmail(email, code, userid);
        //传回隐藏域
        model.addAttribute("emailAddress", email);
        model.addAttribute("useruid", userid);
        model.addAttribute("code", code);
        model.addAttribute("emailResend", "重新发送成功");
        return "message/ConfirmEmail";
    }

    /**（不要）
     * 用于验证用户邮件是否真实存在
     *
     * @param userid         用户id
     * @param email          用户email
     * @param activationCode 用户验证码
     * @param model          模型
     * @return 返回对应数字，0表示修改成功，1表示验证码不正确
     */
    @RequestMapping("/validationEmail.do")
    public String validationEmail(String userid, String email, String activationCode, Model model) {
        User user = new User();
        if (userid == null && userid.length() < 16) {
            return "message/ErrorRegister";
        }
        user.setUserId(userid);
        user.setUserEmail(email);
        int i = userService.updateUserInfo(user, activationCode);
        //0表示修改成功
        if (i == 0) {
            List<User> userinfo = userService.autoLogin(user);
            User userLogin= userinfo.get(0);
            //添加用户信息自动登录session
            model.addAttribute("User", userLogin);
			return "message/SucRegister";
        } else if (i == 1) {
            //1表示验证码不正确
            return "message/ErrorRegister";
        }
        //不存在该用户，返回注册页面
        return "message/ErrorRegister";
    }
    
    
    /* ---------------------------手机注册----------------------------------*/

	/**
	 * 用于用户注册手机号码
	 * @param user 用户对象
	 * @param userInfo 用户附表对象
	 * @param userPassword2 二次后台检验password
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/registerPhone.do")
	public String registerPhone(User user,UserInfo userInfo,String userPassword2,Model model,HttpServletRequest request,HttpServletResponse response){

		//密码和非空校验
		try {
			if (JudgeTools.isNull(user.getUserTelphone())) {
				model.addAttribute("checkError", "请输入手机号码");
				//跳转到错误页面
				return "message/ErrorRegister";
			}
			if (!userPassword2.equals(user.getUserPassword())) {
				model.addAttribute("checkError", "两次密码输入不一致");
				//跳转到错误页面
				return "message/ErrorRegister";
			}
//			//防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
//			//获取用户输入的短信验证码
//			String smsvalistr = request.getParameter("smsvalistr");
//			//获取session存储的短信验证码
//			String smscode = (String) request.getSession().getAttribute("smscode");
//			//判断短信验证码是否匹配
//			if(!smscode.equals(smsvalistr)){
//				model.addAttribute("checkError", "短信验证码输入不一致");
//				//跳转到错误页面
//				return "message/ErrorRegister";
//			}
			//数据非空校验
			user.checkFormat();
		} catch (RegisterException e) {
			model.addAttribute("checkError", e.getMessage());
			//跳转到错误页面
			return "message/ErrorRegister";
		}
		//设置用户id
		String userid = UUID.randomUUID().toString();
		user.setUserId(userid);
		userInfo.setUserId(userid);
		//设置注册时间
		userInfo.setUserRegtime(new Date());
		//激活状态:1为已注册，0为未激活
		userInfo.setUserStatus(1);
		//设置注册用户权限默认为user
		userInfo.setUserPermissions("user");
		//MD5加密密码
		String md5 = MD5Utils.md5(user.getUserPassword());
		user.setUserPassword(md5);

//		//获取session中发送短信后的手机号码（checkSmsCode）
//		String smsphone = (String) request.getSession().getAttribute("smsphone");
//		//进行判断
//		if(!smsphone.equals(user.getUserTelphone())){//手机号码前后不一致
//			model.addAttribute("checkError", "× 该手机号码不是原来的号码，请重新获取验证码！");
//			return "message/ErrorRegister";
//		}

		//数据合法性检验
		//判断用户手机注册
		boolean resultPhone = userService.resgisterPhone(user, userInfo);
		if(resultPhone){
			//true:注册成功
			List<User> userinfo = userService.selectUserLogin(user);
			User userLogin= userinfo.get(0);
			//添加用户信息自动登录session
			model.addAttribute("User", userLogin);
			return "message/SucRegister";
		}else {
			//false:注册失败
			model.addAttribute("checkError", "你注册用户已存在，请勿重复注册");
			return "message/ErrorRegister";
		}
	}






	/**
	 * 使用Ajax校验注册用户手机号码是否存在
	 * @param user 用户注册信息
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkPhone.do")
	public void checkPhone(User user,String newPhone,HttpServletResponse response) throws IOException{
		//设置新手机号码，进行是否存在校验
		if(newPhone != null){
			user.setUserTelphone(newPhone);
		}

		//2.调用业务层的方法来检查手机号码是否存在
		List<User> resultPhone = userService.selectUserExist(user);

		//3.校验手机号码是否存在
		if(resultPhone == null || resultPhone.isEmpty()){
			//手机号码不存在
			response.getWriter().write("<font color='#339933'>√ 该手机号码可以注册，输入正确</font>");
		}else{
			//手机号码已存在
			response.getWriter().write("<font color='red'>× 该手机号码已经被注册，请重新输入</font>");
		}
	}


	/* ------图片验证码-----*/
	@RequestMapping("/ValiImage.do")
	public void ValiImage(HttpServletRequest request,HttpServletResponse response){
		try {
    		/* 控制浏览器不要缓存验证码图片 */
			response.setDateHeader("Expires", -1);
			response.setHeader("Cache-Control", "no-cache");
    		
    		/* 绘制一张验证码图片发送给浏览器 */
			VerifyCode vCode = new VerifyCode();
			vCode.drawImage(response.getOutputStream());

			//获取验证码文本
			String valistr = vCode.getCode();

			//创建session对象
			HttpSession session = request.getSession();

			//把图片验证码保存到session中,在checkCode验证
			session.setAttribute("code", valistr);

			System.out.println("图片验证码："+valistr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 实现功能：光标移走校验图片验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/checkCode.do")
	public void checkCode(String valistr,HttpServletRequest request,HttpServletResponse response){
		try {
			//校验图片验证码
			//获取保存在session的图片验证码
			String code = (String) request.getSession().getAttribute("code");
			//判断验证码是否匹配(先全部转化为小写再校验)
			//先默认为正确
			String data = "1";
			if(null == code){
				//图片验证码为空（防止网络延迟获取不到图片）
				data = "2";
			}else if (!valistr.toLowerCase().equals(code.toLowerCase())) {
				//不匹配
				data = "0";
			}
			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.write(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
