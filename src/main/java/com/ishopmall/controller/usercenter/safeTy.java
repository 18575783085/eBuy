package com.ishopmall.controller.usercenter;

import com.aliyuncs.exceptions.ClientException;
import com.ishopmall.model.User;
import com.ishopmall.model.UserInfo;
import com.ishopmall.service.UserService;
import com.ishopmall.utils.JudgeTools;
import com.ishopmall.utils.MD5Utils;
import com.ishopmall.utils.SendEmail;
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
     * 直接添加或修改邮箱
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/AddEmail.do")
    public String addEmail(String userEmail,HttpSession session, Model model){
        //判断用户输入邮箱格式和是否为空
        if (JudgeTools.isNull(userEmail)) {
            return "errorSend";
        }
        if (!JudgeTools.checkEmail(userEmail)) {
            return "errorSend";
        }
        User user = new User();
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
        user.setUserId(nowUser.getUserId());
        user.setUserEmail(userEmail);
        int result = userService.upadateUser_Email(user);
        if (result > 0) {
            //设置传入进来的邮箱
            nowUser.setUserEmail(userEmail);
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
     */
    @RequestMapping("/addPhone.do")
    public String addPhone(String newPhone,HttpServletRequest request, Model model){
        //非空校验
        if (JudgeTools.isNull(newPhone)) {
            model.addAttribute("checkError", "请输入要绑定手机号码");
            //跳转到错误页面
            return "message/statuPhone";
        }
//        if (JudgeTools.isNull(smsvalistr2)) {
//            model.addAttribute("checkError", "请输入短信验证码");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }
//        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
//        //获取session存储的短信验证码
//        String smscode2 = (String) request.getSession().getAttribute("smscode2");
//        //判断短信验证码是否匹配
//        if(!smscode2.equals(smsvalistr2)){
//            model.addAttribute("checkError", "短信验证码输入不一致");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }
//        //判断“点击保存修改”时，手机号码发送短信后跟点击注册时，该手机号码是否前后一致
//        //获取session中发送短信后的手机号码（checkSmsCode）
//        String smsphone = (String) request.getSession().getAttribute("smsphone2");
//        //进行判断
//        if(!smsphone.equals(newPhone)){//手机号码前后不一致
//            model.addAttribute("checkError", "× 该手机号码不是原来的号码，请重新填写！");
//            return "message/statuPhone";
//        }
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
     * @param newPhone 新绑定的手机号码
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/updatePhone.do")
    public String updatePhone(String newPhone,HttpServletRequest request, HttpServletResponse response, Model model){
        //非空校验
//        //第一个短信验证码框
//        if(JudgeTools.isNull(smsvalistr)){
//            model.addAttribute("checkError", "请输入短信验证码");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }
        //新绑定的手机号码
        if(JudgeTools.isNull(newPhone)){
            model.addAttribute("checkError", "请输入要绑定的手机号码");
            //跳转到错误页面
            return "message/statuPhone";
        }
//        //第二个短信验证码框
//        if (JudgeTools.isNull(smsvalistr2)) {
//            model.addAttribute("checkError", "请输入新绑定的手机号码的短信验证码");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }

//        //对旧手机号码的短信校验
//        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
//        //获取用户输入的短信验证码:smsvalistr
//        //获取session存储的短信验证码
//        String smsCode = (String) request.getSession().getAttribute("smscode");
//        //判断短信验证码是否匹配
//        if(!smsCode.equals(smsvalistr)){
//            model.addAttribute("checkError", "短信验证码输入不一致");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }
//
//        //获取session中发送短信后的手机号码（checkSmsCode）
//        String smsphone2 = (String) request.getSession().getAttribute("smsphone2");
//        //进行判断
//        if(!smsphone2.equals(newPhone)){//新绑定的手机号码前后不一致
//            model.addAttribute("checkError", "× 该手机号码不是原来新绑定的号码，请重新填写！");
//            return "message/statuPhone";
//        }

//        //对新手机号码的短信校验
//        //防止浏览器禁止Ajax，在这里再判断一次短信验证码校验
//        //获取用户输入的短信验证码:smsvalistr2
//        //获取session存储的第二个短信验证码
//        String smsCode2 = (String) request.getSession().getAttribute("smscode2");
//        //判断短信验证码是否匹配
//        if(!smsCode2.equals(smsvalistr2)){
//            model.addAttribute("checkError", "第二个短信验证码输入不一致");
//            //跳转到错误页面
//            return "message/statuPhone";
//        }

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


}
