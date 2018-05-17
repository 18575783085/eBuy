package com.ishopmall.controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ishopmall.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishopmall.service.OrderService;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.PaymentUtil;
import com.ishopmall.utils.PropPayUntils;

@Controller
@RequestMapping("/shop")
@SessionAttributes({"User"})
public class OrderManager {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;


	/**
	 * 获取购物车或者立即购买的商品信息
	 * @param prodId
	 * @param prodName
	 * @param prodUrl
	 * @param prodNum
	 * @param promotionPrice
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/orderCart.do")
	public void orderCart(HttpServletResponse response,HttpServletRequest request,String prodId,String prodName,String prodUrl,String prodNum,String promotionPrice) throws IOException{

		request.getSession().removeAttribute("product");

		Product product = new Product();
		String data = "1";
		System.out.println("图片地址："+prodUrl);

		product.setId(prodId);
		product.setName(prodName);
		product.setProdsNum(Integer.parseInt(prodNum));
		product.setImgUrl(prodUrl);
		product.setPromotionPrice(Double.parseDouble(promotionPrice));
		request.getSession().setAttribute("product", product);

		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(data);
	}

	/**
	 * 添加一条订单信息
	 * @param prodMoney 应支付金额
	 * @param shippingName 物流名称
	 * @param payMonent 支付方式
	 * @param buyerNick 买家留言
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addOrder.do")
	public void orderCommit(String prodImgurl,String prodId,String prodName,String prodNum,String prodMoney,String shippingName,String payMonent,String buyerNick,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		
		String data = "";
		
		//1.判断用户是否登录
		User user = (User) request.getSession().getAttribute("User");
		
		if(user == null){
			//没登录
			data = "2";
		}
		
		//2.这里判断购物车是否为空
		//2.1从session域中---获取购物车对象
		Object cartObj = request.getSession().getAttribute("cart");
		
		//2.1判断购物车是否为空
		if(cartObj == null){//为null
			//跳转回到首页
			data = "3";
		}

		//通过前台获取编号，再从数据库查找对应的快递和快递费
		Shipping shipping = orderService.findShipping(shippingName);
		
		//3创建用户地址实体类，获取该用户的默认地址信息
		UserAddress userAddress = userService.findAddressDefaultStatus(1,user.getUserId());
		
		//4创建Order类对象，并为其属性赋值
		Order order = new Order();

		//4.1设置订单id
		order.setId(UUID.randomUUID().toString());
		//4.2设置商品id（可以直接从获取购物车）
		order.setProdId(prodId);
		//4.3设置商品图片（可以直接从获取购物车）
		order.setProdImgurl(prodImgurl);
		//4.4设置商品数量（可以直接从获取购物车）
		order.setProdNum(Integer.parseInt(prodNum));
		//4.5设置应支付金额（可以直接从获取购物车）
		order.setPayMoney(Double.parseDouble(prodMoney));
		//4.6设置配送方式
		order.setDistribution("快递");
		//4.7设置快递费
		order.setPostFee(shipping.getPostFee());
		//4.8设置交易完成时间
		order.setEndTime(new Date());
		//4.9设置支付方式
		order.setPayMonent(payMonent);
		//4.10设置物流名称
		order.setShippingName(shipping.getName());
		//4.11设置物流单号
		order.setShippingId(UUID.randomUUID().toString());
		//4.12设置收货人名称
		order.setUserReceiver(userAddress.getUserReceiver());
		//4.13设置收货人手机号码
		order.setUserPhone(userAddress.getUserPhone());
		//4.14设置省
		order.setUserProvince(userAddress.getUserProvince());
		//4.15设置市
		order.setUserCity(userAddress.getUserCity());
		//4.16设置区
		order.setUserDistrict(userAddress.getUserDistrict());
		//4.17设置详细地址
		order.setUserAddress(userAddress.getUserAddress());
		//4.18设置用户id
		order.setUserId(user.getUserId());
		//4.19设置买家留言
		order.setBuyerNick(buyerNick);
		//4.20设置买家是否已经评价：1-评价，0-未评价
		if (buyerNick !=null) {
			order.setBuyerRate(1);
		}else {
			order.setBuyerRate(0);
		}
		//4.21设置订单状态,1-代付款，2-代发货，3-待收货，4-待评论
		order.setStatus(2);
		//4.22设置支付状态,1-已支付，2-未支付，0-失效
		order.setPayStatus(2);
		//4.23设置订单创建时间
		order.setCreated(new Date());
		//4.24设置订单更新时间
		order.setUpdated(new Date());

		//5.遍历购物车中的商品信息，并封装List<OrderItem>
		//5.1定义集合List<OrderItem>，保存订单项目对象的集合
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		//4.3获取购物车集合
//		Map<Product, Integer> cart = (Map<Product, Integer>) cartObj;
//		
//		//4.4遍历购物车中的商品
//		for(Map.Entry<Product, Integer> entry:cart.entrySet()){
//			//4.5创建订单列表对象
//			OrderItem orderItem = new OrderItem();
//			
//			//4.6给订单列表的属性赋值
//			//4.6.1获取订单id
//			orderItem.setOrderId(order.getId());
//			
//			//4.6.2获取商品id
//			orderItem.setProduct_id(entry.getKey().getId());
//			
//			//4.6.3获取订单商品数量------获取每一个商品的所购买数量
//			orderItem.setBuynum(entry.getValue());
//			
//			
//			//4.7将订单列表添加到集合
//			orderItems.add(orderItem);
//		}
		
		System.out.println("订单信息："+order);
		
		//把未支付的订单信息插入订单数据表中---参数2传入集合--是把集中的元素存进到数据库的订单列表中（由于时间关系，单个订单信息表和商品订单列表拆开添加）
		int orderCount = orderService.addOrder(order);
		
		if (orderCount != 0) {
			//添加成功
			request.getSession().setAttribute("orderInfo", order);
			data = "1";
		}else {
			data = "4";
		}
		
		//把订单添加到商品订单表
		//orderService.addOrderItem(orderItems);
		//7.添加订单成功
		//7.1清空购物车
		//7.2提示添加成功
		
		//7.3设置定时刷新---跳转到银联支付页面
		
		
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(data);
		
		
	}
	
	
	/**
	 * 获取订单id，修改订单的发货状态、支付状态、交易完成时间、更新时间
	 * @param prodMoney 应支付金额
	 * @param shippingName 物流名称
	 * @param payMonent 支付方式（支付宝/微信）
	 * @param buyerNick 买家留言
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException 
	 */
	@RequestMapping("/confirmpay.do")
	public void orderConfirmpay(String prodImgurl,String prodId,String prodName,String prodNum,String prodMoney,String shippingName,String payMonent,String buyerNick,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException{
		String data = "";
		
		//1.判断用户是否登录
		User user = (User) request.getSession().getAttribute("User");
		
		if(user == null){
			//没登录
			data = "2";
		}
		
		//2.这里判断购物车是否为空
		//2.1从session域中---获取购物车对象
		Object cartObj = request.getSession().getAttribute("cart");
		
		//2.1判断购物车是否为空
		if(cartObj == null){//为null
			//跳转回到首页
			data = "3";
		}

		//通过前台获取编号，再从数据库查找对应的快递和快递费
		Shipping shipping = orderService.findShipping(shippingName);
		
		//3创建用户地址实体类，获取该用户的默认地址信息
		UserAddress userAddress = userService.findAddressDefaultStatus(1,user.getUserId());
		
		//4创建Order类对象，并为其属性赋值
		Order order = new Order();

		//4.1设置订单id
		order.setId(UUID.randomUUID().toString());
		//4.2设置商品id（可以直接从获取购物车）
		order.setProdId(prodId);
		//4.3设置商品图片（可以直接从获取购物车）
		order.setProdImgurl(prodImgurl);
		//4.4设置商品数量（可以直接从获取购物车）
		order.setProdNum(Integer.parseInt(prodNum));
		//4.5设置应支付金额（可以直接从获取购物车）
		order.setPayMoney(Double.parseDouble(prodMoney));
		//4.6设置配送方式
		order.setDistribution("快递");
		//4.7设置快递费
		order.setPostFee(shipping.getPostFee());
		//4.8设置交易完成时间
		order.setEndTime(new Date());
		//4.9设置支付方式
		order.setPayMonent(payMonent);
		//4.10设置物流名称
		order.setShippingName(shipping.getName());
		//4.11设置物流单号
		order.setShippingId(UUID.randomUUID().toString());
		//4.12设置收货人名称
		order.setUserReceiver(userAddress.getUserReceiver());
		//4.13设置收货人手机号码
		order.setUserPhone(userAddress.getUserPhone());
		//4.14设置省
		order.setUserProvince(userAddress.getUserProvince());
		//4.15设置市
		order.setUserCity(userAddress.getUserCity());
		//4.16设置区
		order.setUserDistrict(userAddress.getUserDistrict());
		//4.17设置详细地址
		order.setUserAddress(userAddress.getUserAddress());
		//4.18设置用户id
		order.setUserId(user.getUserId());
		//4.19设置买家留言
		order.setBuyerNick(buyerNick);
		//4.20设置买家是否已经评价：1-评价，0-未评价
		if (buyerNick !=null) {
			order.setBuyerRate(1);
		}else {
			order.setBuyerRate(0);
		}
		//4.21设置订单状态,1-代付款，2-代发货，3-待收货，4-待评论
		order.setStatus(2);
		//4.22设置支付状态,1-已支付，2-未支付，0-失效
		order.setPayStatus(2);
		//4.23设置订单创建时间
		order.setCreated(new Date());
		//4.24设置订单更新时间
		order.setUpdated(new Date());
		
		
		//把未支付的订单信息插入订单数据表中---参数2传入集合--是把集中的元素存进到数据库的订单列表中（由于时间关系，单个订单信息表和商品订单列表拆开添加）
		int orderCount = orderService.addOrder(order);
		
		if (orderCount != 0) {
			//添加成功
			request.getSession().setAttribute("orderInfo", order);
			data = "1";
		}else {
			data = "4";
		}
		
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.write(data);
		
	}
	
	
	
	/**
	 * 确认支付后跳转到支付成功页面
	 * @param orderId 订单id
	 * @param prodMoney 应付款金额
	 * @return
	 */
	@RequestMapping("/successpay.do")
	public String orderSuccesspay(String orderId,String prodMoney,Model model,HttpServletRequest request){
		
		//判断订单id是否为空
		if(JudgeTools.isNull(orderId)){
			model.addAttribute("checkError", "不好意思，您的订单号失效，请重新提交");
			return "message/statuOrderAddress";
		}

		//判断付款金额是否为空
		if(JudgeTools.isNull(prodMoney)){
			model.addAttribute("checkError", "不好意思，您的付款金额丢失了，请重新结算");
			return "message/statuOrderAddress";
		}
		
		Order orderInfo = new Order();
		
		//修改订单的发货状态、支付状态、交易完成时间、更新时间
		orderInfo.setId(orderId);//订单id
		orderInfo.setStatus(1);
		orderInfo.setPayStatus(1);
		orderInfo.setEndTime(new Date());
		orderInfo.setUpdated(new Date());
		orderService.changeOrderStatus(orderInfo);
		
		//跳转到支付成功页面
		return "redirect:success";
	}
	
	
	
	
	/**
	 * 获取订单参数和第三方支付平台参数，实现在线支付（银联支付）
	 */
	@RequestMapping("/orderUnionpay.do")
	public String orderUnionpay(String orderId,String pd_FrpId,HttpServletRequest request){
		
		System.out.println("申请支付的订单："+orderId);
		
		//获取session中的订单对象
		Order orderInfo = (Order) request.getSession().getAttribute("orderInfo");
		
		System.out.println("申请支付的订单："+orderInfo.getId());
		
		// 1、准备参数
		//业务类型
		String p0_Cmd = "Buy";
		// 商户编号
		String p1_MerId = PropPayUntils.getProperty("p1_MerId");
		// 订单id
		String p2_Order = orderInfo.getId();
		// 订单金额：
		String p3_Amt ="0.01";// 测试时使用
		
		//正式使用
		/*//创建订单业务层
		OrderService orderService = BasicFactory.getBasicFactory().getInstance(OrderService.class);
		//调用通过订单id查询订单信息的方法
		Orders orders = orderService.findOrderByOid(p2_Order);
		String p3_Amt = orders.getMoney()+"";*/
		// 交易币种
		String  p4_Cur = "CNY";
		// 商品名称
		String p5_Pid = orderInfo.getProdId();
		// 商品种类
		String p6_Pcat = "";
		// 商品描述
		String p7_Pdesc = "";
		//回调的url地址
		String p8_Url = PropPayUntils.getProperty("responseURL");
		// 收货地址
		String p9_SAF = "";
		// 商户扩展信息
		String pa_MP = "";
		// 支付通道--->选择银行
		//String pd_FrpId = request.getParameter("pd_FrpId");
		//应答机制
		String pr_NeedResponse = "1";
		//签名数据
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, PropPayUntils.getProperty("keyValue"));
		
		
		System.out.println("商户编号："+p1_MerId);
		System.out.println("签名数据："+hmac);
		
		//2.将准备好的参数保存到request作用域中
		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat", p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", hmac);
		
		//3.转发到confirmUnionpay.jsp
		return "forward:ConfirmUnionpay";
		
		
	}
	
	
	/**
	 * 调用第三方支付平台的API（银联支付）
	 * @throws IOException 
	 */
	@RequestMapping("/orderPayCallback.do")
	public String orderPayCallback(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//1.接收第三方支付平台传回的参数
		String p1_MerId = request.getParameter("p1_MerId");//商户编号
		String r0_Cmd = request.getParameter("r0_Cmd");//业务类型
		String r1_Code = request.getParameter("r1_Code");//支付结果
		String r2_TrxId = request.getParameter("r2_TrxId");//支付交易流水号
		String r3_Amt = request.getParameter("r3_Amt");//支付金额
		String r4_Cur = request.getParameter("r4_Cur");//交易币种
		String r5_Pid = request.getParameter("r5_Pid");//商品名称
		String r6_Order = request.getParameter("r6_Order");//商品订单号（订单id）
		String r7_Uid = request.getParameter("r7_Uid");//易宝支付会员ID
		String r8_MP = request.getParameter("r8_MP");//商户拓展信息
		String r9_BType = request.getParameter("r9_BType");//交易结果返回的类型：1表示重定向；2表示点对点通讯
		String rb_BankId = request.getParameter("rb_BankId");//支付通道编码
		String ro_BankOrderId = request.getParameter("ro_BankOrderId");//银行订单编号
		String rp_PayDate = request.getParameter("rp_PayDate");//支付成功时间
		String rq_CardNo = request.getParameter("rq_CardNo");//充值卡序号
		String ru_Trxtime = request.getParameter("ru_Trxtime");//交易结果通知时间
		String hmac = request.getParameter("hmac");//签名数据
		
		System.out.println("商户编号："+p1_MerId);
		System.out.println("签名数据："+hmac);
		
		Order orderInfo = new Order();
		
		//2.验证数据是否被篡改
		boolean result = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, PropPayUntils.getProperty("keyValue"));
		if(!result){//表示数据被篡改了
			System.out.println("数据被篡改了...");
			
		}else {//未被篡改
			//判断重定向过来的还是点对点通讯过来的
			if ("1".equals(r9_BType)) {
				//以下两行代码正式部署时要记得删除掉
				
				//修改订单的发货状态、支付状态、交易完成时间、更新时间
				orderInfo.setId(r6_Order);//订单id
				orderInfo.setStatus(1);
				orderInfo.setPayStatus(1);
				orderInfo.setEndTime(new Date());
				orderInfo.setUpdated(new Date());
				orderService.changeOrderStatus(orderInfo);
				
				
				//重定向过来的
				//response.getWriter().write("您的支付请求已被受理，支付结果需等待进一步的通知");
				response.getWriter().write("success");
				return "redirect:success";
				
			}else if ("2".equals(r9_BType)&&"1".equals(r1_Code)) {
				//点对点通知
				//修改订单的发货状态、支付状态、交易完成时间、更新时间
				orderInfo.setId(r6_Order);//订单id
				orderInfo.setStatus(1);
				orderInfo.setPayStatus(1);
				orderInfo.setEndTime(new Date());
				orderInfo.setUpdated(new Date());
				orderService.changeOrderStatus(orderInfo);
				
				//响应给第三方支付平台success---意思是告诉支付平台，确认支付的意思
				response.getWriter().write("success");
				return "redirect:success";
				
				
			}
			
		}
		return null;
	}
	
	
	
	
	
	
	/**
	 * 用于新增用户地址（订单页面）
	 * @param userReceiver 收货人
	 * @param userPhone 收货人电话
	 * @param userProvince 省
	 * @param userCity 市
	 * @param userDistrict 区
	 * @param userAddress 详细地址
	 * @param request
	 * @param model
	 * @return
	 */
    @RequestMapping("/addAddress.do")
    public void addAddress(String userReceiver,String userPhone,String userProvince,String userCity,String userDistrict,String userAddress,HttpServletRequest request,HttpServletResponse response,Model model){
    	//获取session存储的用户信息
    	User user = (User) request.getSession().getAttribute("User");
    	
    	String data = "";
    	
    	try {
    		//1.数据非空校验
    		if(JudgeTools.isNull(userReceiver)){
    			//收货人为空
    			data = "0";
    		}
    		if(JudgeTools.isNull(userPhone)){
    			//收货人手机号码
    			data = "0";
    		}
    		if(JudgeTools.isNull(userProvince) || JudgeTools.isNull(userCity) || JudgeTools.isNull(userDistrict)){
    			//所在地
    			data = "0";
    		}
    		if(JudgeTools.isNull(userAddress)){
    			//详细地址
    			data = "0";
    		}
    		
    		//校验收货人名字长度
    		if(userReceiver.length() > 11){
    			data = "0";
    		}
    		//校验手机号码格式
    		String regex = "^[1][34578]\\d{9}$";
    		if(!userPhone.matches(regex)){
    			data = "0";
    		}
    		
    		//判断该用户新增地址是否超过3个
    		List<UserAddress> addressList =  userService.findAddress(user.getUserId());
    		
    		int addressSize = addressList.size();
    		System.out.println("长度："+addressSize);
    		if(addressSize >= 3){
    			//超过3个
    			data = "0";
    		}
    		
    		//不超过
    		UserAddress userAddressInfo = new UserAddress();
    		//设置参数
    		userAddressInfo.setUserId(user.getUserId());//设置用户id
    		userAddressInfo.setUserReceiver(userReceiver);//设置收货人
    		userAddressInfo.setUserPhone(userPhone);//设置电话
    		userAddressInfo.setUserProvince(userProvince);//省
    		userAddressInfo.setUserCity(userCity);//市
    		userAddressInfo.setUserDistrict(userDistrict);//区
    		userAddressInfo.setUserAddress(userAddress);//详细地址
    		
    		//判断新增地址是否成功
    		boolean resultAddress = userService.addAddress(userAddressInfo);
    		
    		if(resultAddress){
    			//true:新增成功
    			User userLoginByOne = userService.UserLoginByOne(user);
    			//添加用户信息自动登录session
    			//request.getSession().setAttribute("User", userLoginByOne);
    			model.addAttribute("User", userLoginByOne);
    			data = "1";
    			
    		}else {
    			//false:新增失败
    			data = "0";
    		}
    		
    		response.setContentType("application/json;charset=UTF-8");
    		response.setHeader("Cache-Control", "no-cache");
    		PrintWriter out = response.getWriter();
    		out.write(data);
    		
		} catch (Exception e) {
			e.printStackTrace(); 
			data = "0";
		}
    	
    }
    
    
    /**
     * 用于修改用户地址信息（编辑该地址信息）
     * @param userAddressInfo 地址信息
     * @param model 
     * @param request
     * @return
     */
    @RequestMapping("/updateAddress.do")
    public String updateAddress(UserAddress userAddressInfo,Model model,HttpServletRequest request){

    	//获取存储在session中的用户
    	User user = (User) request.getSession().getAttribute("User");
    	
    	//1.数据非空校验
    	if(JudgeTools.isNull(userAddressInfo.getUserReceiver())){
    		//收货人为空
    		model.addAttribute("checkError", "请输入收货人");
    		return "message/statuOrderAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserPhone())){
    		//收货人手机号码
    		model.addAttribute("checkError", "请输入收货人手机号码");
    		return "message/statuOrderAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserProvince()) || JudgeTools.isNull(userAddressInfo.getUserCity()) || JudgeTools.isNull(userAddressInfo.getUserDistrict())){
    		//所在地
    		model.addAttribute("checkError", "请选择所在地");
    		return "message/statuOrderAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserAddress())){
    		//详细地址
    		model.addAttribute("checkError", "请输入详细地址");
    		return "message/statuOrderAddress";
    	}
    	
    	//校验收货人名字长度
    	if(userAddressInfo.getUserReceiver().length() > 11){
    		model.addAttribute("checkError", "名字太长，请重新输入");
    		return "message/statuOrderAddress";
    	}
    	//校验手机号码格式
    	String regex = "^[1][34578]\\d{9}$";
    	if(!userAddressInfo.getUserPhone().matches(regex)){
    		model.addAttribute("checkError", "手机号码格式不对，请重新输入");
    		return "message/statuOrderAddress";
    	}
    	
    	//把地址数据传进修改方法进行更改编辑
    	int updateAddressCount = userService.updateAddress(userAddressInfo);
    	
    	//判断是否修改
    	if(updateAddressCount == 1){
    		//修改成功--再存进地址session
    		//request.getSession().setAttribute("address", userAddressInfo);
    		//每修改一次地址，用户信息都要查询一次数据，再存储回User的session
    		User userLoginByOne = userService.UserLoginByOne(user);
	        //添加用户信息自动登录session
	        //request.getSession().setAttribute("User", userLoginByOne);
	        model.addAttribute("User", userLoginByOne);
	        model.addAttribute("addressMsg", "恭喜您，修改地址成功！！！");
    		return "message/statuOrderAddress";
    	}else {
    		//false:修改失败
    		model.addAttribute("checkError", "不好意思，修改地址失败，请重新编辑");
    		return "message/statuOrderAddress";
		}
    	
    }	
    
    
    
}
