package com.ishopmall.model;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 用户附属信息表对应字段
 * 2017年11月10日21:45:30
 *
 * @author JAM
 */
@Component
public class UserInfo {
    private String userId;
    private Integer userGender;
    private Date userBirthday;
    private String userPhotopath;
    private Integer userStatus;
    private String userPermissions;
    private String userCode;
    private Date userRegtime;
    private Double userMoney;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getUserGender() {
        return userGender;
    }

    public void setUserGender(Integer userGender) {
        this.userGender = userGender;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserPhotopath() {
        return userPhotopath;
    }

    public void setUserPhotopath(String userPhotopath) {
        this.userPhotopath = userPhotopath;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserPermissions() {
        return userPermissions;
    }

    public void setUserPermissions(String userPermissions) {
        this.userPermissions = userPermissions;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public Date getUserRegtime() {
        return userRegtime;
    }

    public void setUserRegtime(Date userRegtime) {
        this.userRegtime = userRegtime;
    }

    public Double getUserMoney() {
        return userMoney;
    }

    public void setUserMoney(Double userMoney) {
        this.userMoney = userMoney;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId='" + userId + '\'' +
                ", userGender=" + userGender +
                ", userBirthday=" + userBirthday +
                ", userPhotopath='" + userPhotopath + '\'' +
                ", userStatus=" + userStatus +
                ", userPermissions='" + userPermissions + '\'' +
                ", userCode='" + userCode + '\'' +
                ", userRegtime=" + userRegtime +
                ", userMoney=" + userMoney +
                '}';
    }
}
