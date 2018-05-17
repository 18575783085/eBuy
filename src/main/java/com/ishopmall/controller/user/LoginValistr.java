package com.ishopmall.controller.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ishopmall.valistr.GeetestConfig;
import com.ishopmall.valistr.GeetestLib;

/**
 * 滑动验证码接口
 * @author OYE
 *
 */
@Controller
@RequestMapping("/loginValistr")
public class LoginValistr {
	
	/**
	 * 使用Get的方式返回challenge和capthca_id,此方式以实现前后端完全分离的开发模式
	 * 初始化及获取字符串API
	 * @param request
	 * @param response
	 */
	@RequestMapping("/StartCaptcha.do")
	public void StartCaptcha(HttpServletRequest request,HttpServletResponse response){
		try {
			
			GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key());
			
			String resStr = "{}";
			
			//自定义userid
			String userid = "test";
			
			//进行验证预处理
			int gtServerStatus = gtSdk.preProcess(userid);
			
			//将服务器状态设置到session中
			request.getSession().setAttribute(gtSdk.gtServerStatusSessionKey, gtServerStatus);
			//将userid设置到session中
			request.getSession().setAttribute("userid", userid);
			
			resStr = gtSdk.getResponseStr();
			
			PrintWriter out = response.getWriter();
			out.println(resStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/* 备注：暂时还不知道下面的方法执行的效果是什么，因为根据文档好像将验证数据提交到 极验官网上去（要改动form表单），所以hold住不让spring管理先；
	 * 但是我们实现了点登录时必须要滑动验证才能登录，login.do没有受影响！
	 * 	得出一个结论：在网络顺畅的情况下，这个滑动验证就纯粹当作一个普通的滑动验证按钮，
	 * 只作出登录时必须判断是否已滑动验证了才能登录账号。*/
	
	/**
	 * 使用post方式，返回验证结果, request表单中必须包含challenge, validate, seccode
	 * 二次验证及宕机API
	 * @param request
	 * @param response
	 */
	//@RequestMapping("/VerifyLogin.do")
	public void VerifyLogin(HttpServletRequest request,HttpServletResponse response){
		try {
			GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key());
			
			String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
			String validate = request.getParameter(GeetestLib.fn_geetest_validate);
			String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
				
			//从session中获取gt-server状态
			int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
			
			//从session中获取userid
			String userid = (String)request.getSession().getAttribute("userid");
			
			int gtResult = 0;

			if (gt_server_status_code == 1) {
				//gt-server正常，向gt-server进行二次验证
					
				gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
				System.out.println(gtResult);
			} else {
				// gt-server非正常情况下，进行failback模式验证
					
				System.out.println("failback:use your own server captcha validate");
				gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
				System.out.println(gtResult);
			}


			if (gtResult == 1) {
				// 验证成功
				PrintWriter out = response.getWriter();
				JSONObject data = new JSONObject();
				try {
					data.put("status", "success");
					data.put("version", gtSdk.getVersionInfo());
					
				} catch (JSONException e) {
					e.printStackTrace();
				}
				out.println(data.toString());
			}
			else {
				// 验证失败
				JSONObject data = new JSONObject();
				try {
					data.put("status", "fail");
					data.put("version", gtSdk.getVersionInfo());
				} catch (JSONException e) {
					e.printStackTrace();
				}
				PrintWriter out = response.getWriter();
				out.println(data.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
