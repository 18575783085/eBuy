package com.ishopmall.controller.user;

import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.ishopmall.exception.user.RegisterException;
import com.ishopmall.model.User;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.MD5Utils;
import com.ishopmall.utils.SendEmail;
import com.ishopmall.utils.SendSms;
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






	/**（不要）
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


	/**（不要）
	 * 使用Ajax发送手机短信
	 * @param user
	 * @param request
	 * @param response
	 */
	@RequestMapping("/sendSms.do")
	public void sendSms(User user,HttpServletRequest request,HttpServletResponse response){
    	/*
    	 * 已经在更绑手机的前端js做了校验，考虑要不要在后台也做校验，但是手机注册的获取按钮跟更绑手机的按钮1共用一个方法
    	 * 假设：如果有用户刚新增完手机号码，又立即前往注册页面注册手机，导致出现更改频繁的警告语（这个校验在更绑手机的按钮1逻辑没问题）
    	 */
//    	try {
//    		//判断是否已经存在smscookie3
//    		//获取所有Cookies
//    		Cookie cookies[] = request.getCookies();
//    		if (cookies != null) {
//    			//遍历所有cookie
//    			for (int i = 0; i < cookies.length; i++) {
//    				//如果有
//    				if (cookies[i].getName().equals("smscookie3")) {
//    					response.getWriter().write("<font color='red'>× 不好意思，你更换手机号码太频繁了，请在一个小时后再操作吧</font>");
//    					return;
//    				}
//    			}
//    		}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}



		//获取随机生成的验证码
		String code="";
		for(int i=1;i<=6;i++){
			code += (int)(Math.random()*9);
		}
		//将验证码保存在session中
		//先获取一个session对象
		HttpSession session = request.getSession();


			//设置smscode属性保存code值
			session.setAttribute("smscode", code);
			//保存当前发送短信的手机号码进session中
			session.setAttribute("smsphone", user.getUserTelphone());

		//旧打桩
		System.out.println("旧手机号码："+user.getUserTelphone());
		System.out.println("旧手机短信验证码:"+code);
		System.out.println("旧手机短信验证码条数："+message);


    	/*if(newPhone !=null){
    		//设置smscode属性保存code值
       		session.setAttribute("smscode2", code);
       		//保存当前发送短信的手机号码进session中
       		session.setAttribute("smsphone2", newPhone);
    	}
    	//打桩
    	System.out.println("新手机号码："+newPhone);
    	System.out.println("新手机短信验证码:"+code);
    	System.out.println("新手机短信验证码条数："+message);*/


		//3.调用短信接口
		//ajax返回值：data
		String data = "0";
		try {
			//#判断：如果发送短信总数超过5条，则不发送短信并返回警告给前台（不执行以下代码）#
			if(message < 5){
				// 校验电话号码
				String regex = "^[1][34578]\\d{9}$";
				if (!user.getUserTelphone().matches(regex) || user.getUserTelphone() == null) {
					// 校验失败
					response.getWriter().write("<font color='red'>× 请输入有效的手机号码</font>");
					return;
				} else {

					// 3.1.发送短信（号码，验证码）
					SendSmsResponse sendSms = SendSms.sendSms(user.getUserTelphone(), code);

					//等待3秒
					Thread.sleep(3000L);

					// 3.2.查明细
					if (sendSms.getCode() != null && sendSms.getCode().equals("OK")) {
						//发送成功
						data = "1";

						//短信查询api
						QuerySendDetailsResponse querySendDetailsRequest = SendSms.querySendDetails(sendSms.getBizId(), user.getUserTelphone());

						//获取短信条数
						String totalCount = querySendDetailsRequest.getTotalCount();

						//累加数目
						message = message + Integer.parseInt(totalCount);

					}else {
						//发送失败
						data = "0";
					}

				}
			}else {
				//一个手机号码最多可发送5条短信验证码
				data = "2";

			}

			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.write(data);


		} catch (ClientException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	/**（不要）
	 * 实现功能：光标移走校验短信验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/checkSmsCode.do")
	public void checkSmsCode(User user,HttpServletRequest request,HttpServletResponse response){
		try {
			//1.1获取用户输入的验证码(两个短信输入框共用一个校验方法)
			String smsvalistr = request.getParameter("smsvalistr");
			//1.3获取用户输入的旧手机号码参数
			String oldPhone = user.getUserTelphone();
			//1.4获取用户输入的新手机号码参数
			String newPhone = request.getParameter("newPhone");

			//2.1.获取session存储的短信验证码1
			String smscode = (String) request.getSession().getAttribute("smscode");
			//2.2.获取session存储的短信验证码2
			String smscode2 = (String) request.getSession().getAttribute("smscode2");
			//TODO 如何解决验证码的调用


			System.out.println("文本框的手机号码(旧手机号码)："+oldPhone);
			System.out.println("旧手机号码的短信验证码："+smscode);

			System.out.println("新手机号码："+newPhone);
			System.out.println("新手机号码的短信验证码："+smscode2);
			//3.先判断是否是当前手机号码发送短信(这功能已迁移到registPhone里实现) ---> 再判断短信验证码是否匹配
			//4.判断短信验证码是否正确
			String data = "";
			//4.1如果是旧手机号码
			if(oldPhone != null && !"".equals(oldPhone)){
				System.out.println("smsvalistr1："+smsvalistr);
				//4.1.1判断旧手机号码发送的验证码与当前输入的验证码是否匹配
				if(null == smscode){
					//失效
					data = "2";
				}else if (smscode.equals(smsvalistr)) {
					//匹配
					data = "1";
				}else {
					data = "0";
				}
			}
			//4.2如果是新手机号码
			System.out.println("smscode："+smscode);
			System.out.println("smscode2："+smscode2);
			if(newPhone != null && !"".equals(newPhone)){
				System.out.println("smsvalistr2："+smsvalistr);
				//4.2.1判断新手机号码发送的验证码与当前输入的验证码是否匹配
				if(null == smscode2){
					//失效
					data = "2";
				}else if (smscode2.equals(smsvalistr)) {
					//匹配
					data = "1";
				}else {
					//不匹配
					data = "0";
				}
			}

			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.write(data);

		} catch (Exception e) {
			e.printStackTrace();
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
