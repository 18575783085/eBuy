package com.ishopmall.model;

import org.springframework.stereotype.Component;

/**
 * 封装用户地址对象
 * @author JAM
 */
@Component
public class UserAddress {
    private Integer addressId;
    private String userId;
    private String userReceiver;
    private String userPhone;
    private String userProvince;
    private String userCity;
    private String userDistrict;
    private String userAddress;
    private Integer addressStatus;
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserReceiver() {
		return userReceiver;
	}
	public void setUserReceiver(String userReceiver) {
		this.userReceiver = userReceiver;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserProvince() {
		return userProvince;
	}
	public void setUserProvince(String userProvince) {
		this.userProvince = userProvince;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserDistrict() {
		return userDistrict;
	}
	public void setUserDistrict(String userDistrict) {
		this.userDistrict = userDistrict;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Integer getAddressStatus() {
		return addressStatus;
	}
	public void setAddressStatus(Integer addressStatus) {
		this.addressStatus = addressStatus;
	}
	@Override
	public String toString() {
		return "UserAddress [addressId=" + addressId + ", userId=" + userId + ", userReceiver=" + userReceiver
				+ ", userPhone=" + userPhone + ", userProvince=" + userProvince + ", userCity=" + userCity
				+ ", userDistrict=" + userDistrict + ", userAddress=" + userAddress + ", addressStatus=" + addressStatus
				+ "]";
	}
    

	
   
}
