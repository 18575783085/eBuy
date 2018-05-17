package com.ishopmall.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页的顶部和底部的链接跳转
 * @author OYE
 *
 */
@Controller
@RequestMapping("/shop")
public class shopIndex {

	//结算页面
	@RequestMapping("/pay")
	public String shopPay(Model model){
		return "/shop/pay";
	}
	
	//银联方式页面
	@RequestMapping("/unionpay")
	public String shopUnionpay(Model model){
		return "/shop/unionpay";
	}
	//银联--订单支付确认页面
	@RequestMapping("/ConfirmUnionpay")
	public String shopConfirmUnionpay(Model model){
		return "/message/ConfirmUnionpay";
	}
	
	
	//微信/支付宝页面
	@RequestMapping("/Confirmpay")
	public String shopConfirmpay(Model model){
		return "/message/Confirmpay";
	}
	
	
	//成功支付页面
	@RequestMapping("/success")
	public String shopSuccess(Model model){
		return "/shop/success";
	}
	
}
