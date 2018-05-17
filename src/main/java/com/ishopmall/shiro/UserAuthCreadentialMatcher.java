package com.ishopmall.shiro;

import com.ishopmall.utils.MD5Utils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.springframework.stereotype.Component;

/**
 * 处理token令牌登录进行加密
 * @author JAM
 * 时间：2017年11月24日12:25:42
 */
@Component
public class UserAuthCreadentialMatcher extends SimpleCredentialsMatcher {

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        //把用户输入的密码进行MD5加密
        UsernamePasswordToken usertoken = (UsernamePasswordToken) token;
        //把用户输入的密码取出，char数组转换成string
        String password = String.valueOf(usertoken.getPassword());
        password= MD5Utils.md5(password);
        usertoken.setPassword(password.toCharArray());
        return super.doCredentialsMatch(usertoken, info);
    }
}
