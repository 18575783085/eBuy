package com.ishopmall.controller.usercenter;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ishopmall.model.User;
import com.ishopmall.model.UserAddress;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;

/**
 * 描述：
 * 用于管理用户地址
 *
 * @author JAM
 * @create 2017-11-15 20:01
 **/
@Controller
@RequestMapping("/usercenter")
@SessionAttributes({"User"})
public class addressManage {

	@Autowired
	private UserService userService;
	
    /**
     * 用于新增用户地址
     * @param consignee 收货人
     * @param consigneePhone 收货人手机号码
     * @param consigneeIntro 收货人的详细信息
     * @param province 省份
     * @param city 市
     * @param area 区
     * @param model
     * @return
     */
    @RequestMapping("/addAddress.do")
    public String addAddress(UserAddress userAddress,HttpServletRequest request,Model model){
    	//获取session存储的用户信息
    	User user = (User) request.getSession().getAttribute("User");
    	
    	//1.数据非空校验
    	if(JudgeTools.isNull(userAddress.getUserReceiver())){
    		//收货人为空
    		model.addAttribute("checkError", "请输入收货人");
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddress.getUserPhone())){
    		//收货人手机号码
    		model.addAttribute("checkError", "请输入收货人手机号码");
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddress.getUserProvince()) || JudgeTools.isNull(userAddress.getUserCity()) || JudgeTools.isNull(userAddress.getUserDistrict())){
    		//所在地
    		model.addAttribute("checkError", "请选择所在地");
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddress.getUserAddress())){
    		//详细地址
    		model.addAttribute("checkError", "请输入详细地址");
    		return "message/statuAddress";
    	}
    	
    	//校验收货人名字长度
    	if(userAddress.getUserReceiver().length() > 11){
    		model.addAttribute("checkError", "名字太长，请重新输入");
    		return "message/statuAddress";
    	}
    	//校验手机号码格式
    	String regex = "^[1][34578]\\d{9}$";
    	if(!userAddress.getUserPhone().matches(regex)){
    		model.addAttribute("checkError", "手机号码格式不对，请重新输入");
    		return "message/statuAddress";
    	}
    	
    	//判断该用户新增地址是否超过3个
    	List<UserAddress> addressList =  userService.findAddress(user.getUserId());
    	
    	int addressSize = addressList.size();
		System.out.println("长度："+addressSize);
    	if(addressSize >= 3){
    		//超过3个
    		model.addAttribute("checkError", "不好意思，用户您的地址过多，请删除后再重新添加");
    		return "message/statuAddress";
    	}
    	
    	//不超过
    	//设置参数
    	userAddress.setUserId(user.getUserId());//设置用户id
    	
    	
    	//判断新增地址是否成功
    	boolean resultAddress = userService.addAddress(userAddress);
    	
    	if(resultAddress){
    		//true:新增成功
			User userLoginByOne = userService.UserLoginByOne(user);
	        //添加用户信息自动登录session
	        //request.getSession().setAttribute("User", userLoginByOne);
	        model.addAttribute("User", userLoginByOne);
	        model.addAttribute("addressMsg", "恭喜您，新增地址成功！！！");
	        return "message/statuAddress";
    	}else {
			//false:新增失败
    		model.addAttribute("checkError", "不好意思，新增地址失败，请重新添加");
    		return "message/statuAddress";
		}
    	
    }
    
    
    /**
     * 用于更换用户默认地址
     * @param addressId 用户地址id
     * @param userId 用户id
     */
    @RequestMapping("/changeDefalutAddress.do")
    public void changeDefalutAddress(String addressId,String userId,Model model,HttpServletRequest request,HttpServletResponse response){
    	String data = "";
    	try {
			
    		if(addressId !=null && userId != null){//判断地址id和用户是否为空
    			//将该用户选择的地址状态设置为1
    			int defaultStatus = userService.changeDefaultStatus(1,addressId,userId);
    			//将该用户没被选中的地址状态设置为0
    			int noDefaultStatus = userService.changeNoDefaultStatus(0,addressId,userId);
    			
    			//获取被设置默认地址的信息
    			UserAddress addressInfo = userService.findAddressByOne(addressId, userId);
    			//拼接地址信息
        		String addressList = addressInfo.getAddressId()+","+addressInfo.getUserId()+","+addressInfo.getUserReceiver()+","+addressInfo.getUserPhone()+","+addressInfo.getUserProvince()+","+addressInfo.getUserCity()+","+addressInfo.getUserDistrict()+","+addressInfo.getUserAddress()+","+addressInfo.getAddressStatus();

    			if(defaultStatus == 1 || noDefaultStatus >0){
    				//获取session存储的用户信息
    		    	User user = (User) request.getSession().getAttribute("User");
    				User userLoginByOne = userService.UserLoginByOne(user);
    				 model.addAttribute("User", userLoginByOne);
    				 
    				data = addressList;
    			}else {
    				data = "";
				}
    		}else {
    			data = "";
    		}
    		response.setContentType("application/json;charset=UTF-8");
    		response.setHeader("Cache-Control", "no-cache");
    		PrintWriter out = response.getWriter();
    		out.write(data);
		} catch (Exception e) {
			//发送错误到页面
			e.printStackTrace();
			data ="";
		}
    }
    
   
    /**
     * 用于修改用户地址信息（回显地址数据）
     * @param addressId 地址id
     * @param userId 用户id
     * @return
     */
    @RequestMapping("/modifyAddress.do")
    public void modifyAddress(String addressId,String userId,HttpServletRequest request,HttpServletResponse response){
    	try {
			
    		//通过地址id和用户id查询该地址的所有信息
    		UserAddress address = userService.findAddressByOne(addressId,userId);
    		System.out.println(address);
    		//将当前用户地址存进session，用于回显数据
    		request.getSession().setAttribute("address", address);
    		
    		//返回数据(问题：点击"编辑"后，要刷新，编辑框才能有数据出现，所以用html标签赋值来立即得到数据)
    		String addressList = address.getAddressId()+","+address.getUserId()+","+address.getUserReceiver()+","+address.getUserPhone()+","+address.getUserProvince()+","+address.getUserCity()+","+address.getUserDistrict()+","+address.getUserAddress()+","+address.getAddressStatus();
    		
    		response.setContentType("application/json;charset=UTF-8");
    		response.setHeader("Cache-Control", "no-cache");
    		PrintWriter out = response.getWriter();
    		out.write(addressList.toString());
    		
		} catch (Exception e) {
			e.printStackTrace();
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
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserPhone())){
    		//收货人手机号码
    		model.addAttribute("checkError", "请输入收货人手机号码");
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserProvince()) || JudgeTools.isNull(userAddressInfo.getUserCity()) || JudgeTools.isNull(userAddressInfo.getUserDistrict())){
    		//所在地
    		model.addAttribute("checkError", "请选择所在地");
    		return "message/statuAddress";
    	}
    	if(JudgeTools.isNull(userAddressInfo.getUserAddress())){
    		//详细地址
    		model.addAttribute("checkError", "请输入详细地址");
    		return "message/statuAddress";
    	}
    	
    	//校验收货人名字长度
    	if(userAddressInfo.getUserReceiver().length() > 11){
    		model.addAttribute("checkError", "名字太长，请重新输入");
    		return "message/statuAddress";
    	}
    	//校验手机号码格式
    	String regex = "^[1][34578]\\d{9}$";
    	if(!userAddressInfo.getUserPhone().matches(regex)){
    		model.addAttribute("checkError", "手机号码格式不对，请重新输入");
    		return "message/statuAddress";
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
    		return "message/statuAddress";
    	}else {
    		//false:修改失败
    		model.addAttribute("checkError", "不好意思，修改地址失败，请重新编辑");
    		return "message/statuAddress";
		}
    	
    }
    
    
    
    /**
     * 用于删除用户地址信息
     * @return
     */
    @RequestMapping("/deleteAddress.do")
    public void deleteAddress(String addressId,String userId,Model model,HttpServletRequest request,HttpServletResponse response){
    	User user = (User) request.getSession().getAttribute("User");
    	
    	String data = "";
    	try {
    		if(addressId !=null && userId != null){//判断地址id和用户id是否为空
    			//点击删除按钮进行删除该用户地址
    			int delete = userService.deleteAddress(addressId,userId);
    			if(delete == 1){
    				//删除地址后，再查询一下用户信息
    				User userLoginByOne = userService.UserLoginByOne(user);
    				model.addAttribute("User", userLoginByOne);
    				data = "1";
    			}else {
    				data = "0";
    			}
    			
    			
    		}else {
    			data = "0";
    		}
    		response.setContentType("application/json;charset=UTF-8");
    		response.setHeader("Cache-Control", "no-cache");
    		PrintWriter out = response.getWriter();
    		out.write(data);
			
		} catch (Exception e) {
			//发送错误到页面
			e.printStackTrace();
			data ="0";
		}
    	
    }
    
}
