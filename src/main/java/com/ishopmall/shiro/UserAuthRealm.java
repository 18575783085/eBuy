package com.ishopmall.shiro;

import com.ishopmall.model.User;
import com.ishopmall.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class UserAuthRealm extends SimpleAccountRealm {

    @Autowired
    private UserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken logintoken = (UsernamePasswordToken) token;
        //内部判断才用登录方式：邮箱和手机
        String username=logintoken.getUsername();
        String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        String ph = "^[1][34578]\\d{9}$";
        User user = new User();
        if (username.matches(em)){
            user.setUserEmail(username);
            User userlogin = userService.UserLoginByOne(user);
            AuthenticationInfo info = new SimpleAuthenticationInfo(userlogin,userlogin.getUserPassword(),this.getName());
            return info;
        }else if (username.matches(ph)){
            user.setUserTelphone(username);
            User userlogin = userService.UserLoginByOne(user);
            AuthenticationInfo info = new SimpleAuthenticationInfo(userlogin,userlogin.getUserPassword(),this.getName());
            return info;
        }
        AuthenticationInfo info = new SimpleAuthenticationInfo();
        return info;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return super.doGetAuthorizationInfo(principals);
    }
}
