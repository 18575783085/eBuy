package com.ishopmall.controller.usercenter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ishopmall.model.User;
import com.ishopmall.model.UserComment;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserCommentService;
import com.ishopmall.service.UserService;

/**
 * 控制用户中心页面跳转的控制器
 * @author JAM
 * 2017年11月22日11:00:25
 */

@RequestMapping("/usercenter")
@Controller
public class UserCenterIndex {
	@Autowired
	private UserCommentService userCommentService;
	@Autowired
	private UserService userService;
    @RequestMapping("/index")
    public String userIndex(Model model){
        return "usercenter/index";
    }

  //个人信息
    @RequestMapping("/information")
    public String userIntroduction(String userId,HttpSession session,Model model){
    	
    		//根据userId查找用户
        	User user = userService.findByUserId(userId);
        	//转变日期格式
        	if(user!=null){
        		String[] birthStr = userService.changeBirthday(user.getUserInfo().getUserBirthday());
            	model.addAttribute("birthStr", birthStr);
        	}
        	//TODO 插入数据库用户名中文乱码
        	model.addAttribute("User", user);
        	session.setAttribute("User", user);
        	System.out.println(userId);
            return "usercenter/information";
    	
    }
    @RequestMapping("/info")
    public String userIntroductionUpdate(User user,String year,String month,String day){
    	System.out.println(user);
    	userService.updateInformation(user,year,month,day);
        return "usercenter/index";
    }

    //安全设置
    @RequestMapping("/safety")
    public String userSafety(Model model){
        return "usercenter/safety";
    }

    //用户地址
    @RequestMapping("/address")
    public String userAddress(Model model){
        return "usercenter/address";
    }

    //订单管理
    @RequestMapping("/order")
    public String userOrder(Model model){
        return "usercenter/order";
    }
    
    //订单详情
    @RequestMapping("/orderinfo")
    public String userOrderinfo(Model model){
    	return "usercenter/orderinfo";
    }
    
    //查看物流
    @RequestMapping("/logistics")
    public String userLogistics(Model model){
    	return "usercenter/logistics";
    }
    
    
    //商品评价
    @RequestMapping("/comment")
    public ModelAndView showComment(String userId,HttpServletRequest request,ModelAndView mv,@RequestParam(required=true,defaultValue="1")Integer page,@RequestParam(required=false,defaultValue="2")Integer pageSize){
    	User user = (User) request.getSession().getAttribute("User");
    	userId = user.getUserId();
    	PageHelper.startPage(page, pageSize);
    	List<UserComment> list = userCommentService.findAll(userId);
    	PageInfo<UserComment> p = new PageInfo<UserComment>(list);
    	mv.addObject("commentList",list);
    	mv.addObject("page",p);
    	mv.setViewName("usercenter/comment");
    	return mv;
    }


    //账户余额
    @RequestMapping("/wallet")
    public String money(Model model,HttpSession session){
		User user = (User) session.getAttribute("User");
		
		if (user==null) {//说明用户未登录
			model.addAttribute("userMoney", "0.0");
		}else {
			String userId = user.getUserId();
			UserInfo userInfo = userService.findMoney(userId);
			model.addAttribute("userInfo", userInfo);
		}
		return "/usercenter/wallet";
	}
    
    //账户明细
    @RequestMapping("/walletlist")
    public String userWalletlist(Model model){
    	return "usercenter/walletlist";
    }
    
    

    //账单明细
    @RequestMapping("/bill")
    public String userBill(Model model){
        return "usercenter/bill";
    }
    
    //支出明细和收入明细
    @RequestMapping("/billlist")
    public String userBilllist(Model model){
        return "usercenter/billlist";
    }
    

    //商品收藏
    @RequestMapping("/collection")
    public String userCollection(Model model){
        return "usercenter/collection";
    }

    //意见反馈
    @RequestMapping("/suggest")
    public String userSuggest(Model model){
        return "usercenter/suggest";
    }

    //我的消息
    @RequestMapping("/news")
    public String userNews(Model model){
        return "usercenter/news";
    }

    //密码修改
    @RequestMapping("/password")
    public String userPassword(Model model){
        return "usercenter/password";
    }

    //手机绑定或者解绑
    @RequestMapping("/bindphone")
    public String userBindphone(Model model){
        return "usercenter/bindphone";
    }

    //邮箱绑定或者换绑
    @RequestMapping("/email")
    public String userEmail(Model model){
        return "usercenter/email";
    }
    

}
