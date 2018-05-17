package com.ishopmall.controller.usercenter;

import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.ishopmall.model.User;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.MD5Utils;
import com.ishopmall.utils.SendEmail;
import com.ishopmall.utils.SendSms;
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
import java.util.List;

/**
 * 用于个人中心账户管理
 */
@Controller
@SessionAttributes({"User"})
@RequestMapping("/usercenter")
public class safeTy {
    @Autowired
    private UserService userService;

    public String changeEmail() {
        return null;
    }

    /**
     * 用于添加新邮箱
     *
     * @param userEmail 用户邮箱
     * @param session   对象
     * @param model     模型
     * @return 返回发送状态页面
     */
    @RequestMapping("/SendEmail.do")
    public String AddEmail(String userEmail, HttpSession session, Model model) {
        //判断用户输入邮箱格式和是否为空
        if (JudgeTools.isNull(userEmail)) {
            return "errorSend";
        }
        if (!JudgeTools.checkEmail(userEmail)) {
            return "errorSend";
        }
        User user = (User) session.getAttribute("User");
        //校验完成后发送邮件,新开一个对象发送，避免用user发送设置邮箱，这样会设置进seesion里面导致逻辑出错
        User tempuser = new User();
        tempuser.setUserEmail(userEmail);
        tempuser.setUserName(user.getUserName());
        tempuser.setUserId(user.getUserId());
        String code = MD5Utils.md5(tempuser.getUserEmail() + tempuser.getUserName());
        try {
            //尝试发送Email
            SendEmail.addemail(tempuser);
        } catch (Exception e) {
            //发送失败则转到错误页面
            e.printStackTrace();
            model.addAttribute("msg", "发送失败，请稍后重试");
            return "message/statuSend";
        }
        //发送成功往注册表修改code
        UserInfo userInfo = user.getUserInfo();
        userInfo.setUserCode(code);
        int res = userService.updateUserInfo_Code(userInfo);
        model.addAttribute("msg", "你已成功发送，请注意查收");
        return "message/statuSend";
    }

    /**
     * 验证是否正确邮箱
     *
     * @return 返回发送状态页面
     */
    @RequestMapping("/resetValidationEmail.do")
    public String validationEmail(String userid, String email, String activationCode, HttpSession session, Model model) {
        User user = new User();
        user.setUserId(userid);
        //获取现在User对象里面的信息，包括UserInfo信息
        User nowUser = (User) session.getAttribute("User");
        //非空判断
        if (nowUser==null){
            model.addAttribute("msg", "请登入后再操作");
            return "message/statuSend";
        }
        //现在User对象里面的邮箱地址和code
        String nowUserEmail = nowUser.getUserEmail();
        UserInfo nowUserUserInfo = nowUser.getUserInfo();
        String nowUserCode = nowUserUserInfo.getUserCode();
        if(nowUserCode!=null){
            List<UserInfo> infos = userService.selectUserInfo(nowUserUserInfo);
            nowUserUserInfo=infos.get(0);
        }
        //非空和合法性检验
        if (nowUser == null) {
            model.addAttribute("msg", "验证失败");
            return "message/statuSend";
        }
        if (userid == null && userid.length() < 16 && nowUser.getUserId().equals(userid)) {
            model.addAttribute("msg", "验证失败");
            return "message/statuSend";
        }
        user.setUserId(userid);
        user.setUserEmail(email);
        userService.upadateUser_Email(user);
        //设置传入进来的邮箱
        nowUser.setUserEmail(email);
        //传入对象进行判断，1.传入user对象 2.现在user对象的userinfo信息 3.现在user对象 4.验证码
        boolean res = userService.validationEmail(user, nowUserUserInfo, nowUser, activationCode);
        if (res) {
            //验证正确,执行更新用户邮箱操作
            model.addAttribute("msg", "验证成功，你的邮箱已添加");
            model.addAttribute("User", nowUser);
            return "message/statuSend";
        }
        //验证失败，返回至验证失败页面，并且把原来邮箱状态重新写回数据库
        model.addAttribute("msg", "验证失败");
        user.setUserEmail(nowUserEmail);
        nowUser.setUserEmail(nowUserEmail);
        userService.upadateUser_Email(user);
        model.addAttribute("User", nowUser);
        return "message/statuSend";
    }

    /**
     * 绑定新手机号码
     *
     * @param newPhone 新手机号码
     * @param smsvalistr2 新手机号码的短信验证码
     */
    @RequestMapping("/addPhone.do")
    public String addPhone(String newPhone, String smsvalistr2, HttpServletRequest request, Model model){
        //非空校验
        if (JudgeTools.isNull(newPhone)) {
            model.addAttribute("checkError", "请输入要绑定手机号码");
            //跳转到错误页面
            return "message/statuPhone";
        }
        if (JudgeTools.isNull(smsvalistr2)) {
            model.addAttribute("checkError", "请输入短信验证码");
            //跳转到错误页面
            return "message/statuPhone";
        }
        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
        //获取session存储的短信验证码
        String smscode2 = (String) request.getSession().getAttribute("smscode2");
        //判断短信验证码是否匹配
        if(!smscode2.equals(smsvalistr2)){
            model.addAttribute("checkError", "短信验证码输入不一致");
            //跳转到错误页面
            return "message/statuPhone";
        }
        //判断“点击保存修改”时，手机号码发送短信后跟点击注册时，该手机号码是否前后一致
        //获取session中发送短信后的手机号码（checkSmsCode）
        String smsphone = (String) request.getSession().getAttribute("smsphone2");
        //进行判断
        if(!smsphone.equals(newPhone)){//手机号码前后不一致
            model.addAttribute("checkError", "× 该手机号码不是原来的号码，请重新获取验证码！");
            return "message/statuPhone";
        }
        //获取session存储的User对象
        User user = (User) request.getSession().getAttribute("User");
        //TODO 是否需要在后台再一次校验新增手机号码是否存在
        //不存在
        //设置新手机号码
        user.setUserTelphone(newPhone);
        //判断新手机号码插入/修改成功
        boolean result = userService.updateUser_Phone(user);
        if(result){
            //true:插入成功
            List<User> userinfo = userService.selectUserLogin(user);
            User userLogin= userinfo.get(0);
            //添加用户信息自动登录session
            model.addAttribute("User", userLogin);
            return "message/statuPhone";
        }else {
            //false:插入失败
            model.addAttribute("checkError", "你绑定的新手机号码已存在，请重新绑定");
            return "message/statuPhone";
        }

    }

    /**
     * 修改（更新）用户主表的手机号码信息
     *
     * @param smsvalistr 旧手机号码的短信验证码
     * @param newPhone 新绑定的手机号码
     * @param smsvalistr2 新绑定的手机号码的短信验证码
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/updatePhone.do")
    public String updatePhone(String smsvalistr, String newPhone, String smsvalistr2, HttpServletRequest request, HttpServletResponse response, Model model){
        //非空校验
        //第一个短信验证码框
        if(JudgeTools.isNull(smsvalistr)){
            model.addAttribute("checkError", "请输入短信验证码");
            //跳转到错误页面
            return "message/statuPhone";
        }
        //新绑定的手机号码
        if(JudgeTools.isNull(newPhone)){
            model.addAttribute("checkError", "请输入要绑定的手机号码");
            //跳转到错误页面
            return "message/statuPhone";
        }
        //第二个短信验证码框
        if (JudgeTools.isNull(smsvalistr2)) {
            model.addAttribute("checkError", "请输入新绑定的手机号码的短信验证码");
            //跳转到错误页面
            return "message/statuPhone";
        }

        //对旧手机号码的短信校验
        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
        //获取用户输入的短信验证码:smsvalistr
        //获取session存储的短信验证码
        String smsCode = (String) request.getSession().getAttribute("smscode");
        //判断短信验证码是否匹配
        if(!smsCode.equals(smsvalistr)){
            model.addAttribute("checkError", "短信验证码输入不一致");
            //跳转到错误页面
            return "message/statuPhone";
        }

        //获取session中发送短信后的手机号码（checkSmsCode）
        String smsphone2 = (String) request.getSession().getAttribute("smsphone2");
        //进行判断
        if(!smsphone2.equals(newPhone)){//新绑定的手机号码前后不一致
            model.addAttribute("checkError", "× 该手机号码不是原来新绑定的号码，请重新获取验证码！");
            return "message/statuPhone";
        }

        //对新手机号码的短信校验
        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
        //获取用户输入的短信验证码:smsvalistr2
        //获取session存储的第二个短信验证码
        String smsCode2 = (String) request.getSession().getAttribute("smscode2");
        //判断短信验证码是否匹配
        if(!smsCode2.equals(smsvalistr2)){
            model.addAttribute("checkError", "第二个短信验证码输入不一致");
            //跳转到错误页面
            return "message/statuPhone";
        }

        //获取存储在session中的User对象
        User user = (User) request.getSession().getAttribute("User");
        //设置新换绑的手机号码
        user.setUserTelphone(newPhone);

        //不存在
        //修改用户主表的手机号码信息
        boolean updateUser_Phone = userService.updateUser_Phone(user);
        //判断是否修改成功
        if(updateUser_Phone){
            ///true:修改成功
            List<User> userinfo = userService.selectUserLogin(user);
            User userLogin= userinfo.get(0);
            //添加用户信息自动登录session
            model.addAttribute("User", userLogin);
            return "message/statuPhone";
        }else {
            //false:修改失败
            model.addAttribute("checkError", "你绑定的新手机号码已存在，请重新绑定");
            return "message/statuPhone";
        }


    }

    /**
     * 短信总条数
     */
    private static int message2 = 0;

    /**
     * 新绑定手机使用Ajax发送手机短信（按钮2）
     * @param newPhone 新绑定手机号码
     * @param request
     * @param response
     */
    @RequestMapping("/sendSms2.do")
    public void sendSms(String newPhone,HttpServletRequest request,HttpServletResponse response){
        //获取随机生成的验证码
        String code="";
        for(int i=1;i<=6;i++){
            code += (int)(Math.random()*9);
        }
        //将验证码保存在session中
        //先获取一个session对象
        HttpSession session = request.getSession();

        //设置smscode属性保存code值
        session.setAttribute("smscode2", code);
        //保存当前发送短信的手机号码进session中
        session.setAttribute("smsphone2",newPhone);
        //打桩
        System.out.println("新手机号码："+newPhone);
        System.out.println("新手机短信验证码:"+code);
        System.out.println("新手机短信验证码条数："+message2);


        //3.调用短信接口
        //ajax返回值：data
        String data = "0";
        try {
            //#判断：如果发送短信总数超过5条，则不发送短信并返回警告给前台（不执行以下代码）#
            if(message2 < 5){
                // 校验电话号码
                String regex = "^[1][34578]\\d{9}$";
                if (!newPhone.matches(regex) || newPhone == null) {
                    // 校验失败
                    response.getWriter().write("<font color='red'>× 请输入有效的手机号码</font>");
                    return;
                } else {
                    // 3.1.发送短信（号码，验证码）
                    SendSmsResponse sendSms = SendSms.sendSms(newPhone, code);
                    //等待3秒
                    Thread.sleep(3000L);
                    // 3.2.查明细
                    if (sendSms.getCode() != null && sendSms.getCode().equals("OK")) {
                        //发送成功
                        data = "1";
                        //短信查询api
                        QuerySendDetailsResponse querySendDetailsRequest = SendSms.querySendDetails(sendSms.getBizId(), newPhone);
                        //获取短信条数
                        String totalCount = querySendDetailsRequest.getTotalCount();
                        //累加数目
                        message2 = message2 + Integer.parseInt(totalCount);
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
}
