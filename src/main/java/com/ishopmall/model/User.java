package com.ishopmall.model;

import com.ishopmall.exception.user.RegisterException;
import com.ishopmall.utils.JudgeTools;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component
public class User implements Serializable {
    private String userId;
    private String userName;
    private String userPassword;
    private String userTelphone;
    private String userEmail;
   

	//一对一关系，一个用户只有一个用户信息表
    private UserInfo userInfo;
    //一对多关系，一个用户可以拥有多个收货地址
    //private UserAddress[] userAddressInfo;
    private List<UserAddress> userAddress;
    
    //数据合法性校验
    public void checkFormat() throws RegisterException {
        if (JudgeTools.isNull(userName)) {
            throw new RegisterException("你输入的用户名为空");
        }
        if (JudgeTools.isNull(userPassword)) {
            throw new RegisterException("你输入的密码为空");
        }
        //如果邮箱不是为空再校验
        if (!JudgeTools.isNull(userEmail)) {
            if (!JudgeTools.checkAddress(userEmail)) {
                throw new RegisterException("你输入的邮箱格式不正确");
            }
        }
        if (!JudgeTools.isNull(userTelphone)) {
            if (!JudgeTools.checkTel(userTelphone)) {
                throw new RegisterException("你输入的电话格式不正确");
            }
        }
    }

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserTelphone() {
		return userTelphone;
	}

	public void setUserTelphone(String userTelphone) {
		this.userTelphone = userTelphone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public List<UserAddress> getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(List<UserAddress> userAddress) {
		this.userAddress = userAddress;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userPassword=" + userPassword + ", userTelphone="
				+ userTelphone + ", userEmail=" + userEmail + ", userInfo="
				+ userInfo + ", userAddress=" + userAddress + "]";
	}

    
}
