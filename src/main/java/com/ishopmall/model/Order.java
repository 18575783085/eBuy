package com.ishopmall.model;

import java.util.Date;

/**
 * 订单实体类
 * @author OYE
 *
 */
public class Order {

	/**
	 * 订单id
	 */
	private String id;
	/**
	 * 商品id
	 */
	private String prodId;
	/**
	 * 商品图片
	 */
	private String prodImgurl;
	/**
	 * 商品数量
	 */
	private Integer prodNum;
	/**
	 * 应支付金额
	 */
	private Double payMoney;
	/**
	 * 配送方式
	 */
	private String distribution;
	/**
	 * 快递费
	 */
	private Integer postFee;
	/**
	 * 交易完成时间
	 */
	private Date endTime;
	/**
	 * 支付方式
	 */
	private String payMonent;
	/**
	 * 物流名称
	 */
	private String shippingName;
	/**
	 * 物流单号
	 */
	private String shippingId;
	/**
	 * 收货人名称
	 */
	private String userReceiver;
	/**
	 * 收货人名称
	 */
	private String userPhone;
	/**
	 * 省
	 */
	private String userProvince;
	/**
	 * 市
	 */
    private String userCity;
    /**
     * 区
     */
    private String userDistrict;
	/**
	 * 收货人详细地址
	 */
	private String userAddress;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 买家留言
	 */
	private String buyerNick;
	/**
	 * 买家评价
	 */
	private Integer buyerRate;
	/**
	 * 订单状态
	 */
	private Integer status;
	/**
	 * 支付状态
	 */
	private Integer payStatus;
	/**
	 * 订单创建时间
	 */
	private Date created;
	/**
	 * 订单更新时间
	 */
	private Date updated;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getProdImgurl() {
		return prodImgurl;
	}
	public void setProdImgurl(String prodImgurl) {
		this.prodImgurl = prodImgurl;
	}
	public Integer getProdNum() {
		return prodNum;
	}
	public void setProdNum(Integer prodNum) {
		this.prodNum = prodNum;
	}
	public Double getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(Double payMoney) {
		this.payMoney = payMoney;
	}
	public String getDistribution() {
		return distribution;
	}
	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}
	public Integer getPostFee() {
		return postFee;
	}
	public void setPostFee(Integer postFee) {
		this.postFee = postFee;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getPayMonent() {
		return payMonent;
	}
	public void setPayMonent(String payMonent) {
		this.payMonent = payMonent;
	}
	public String getShippingName() {
		return shippingName;
	}
	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}
	public String getShippingId() {
		return shippingId;
	}
	public void setShippingId(String shippingId) {
		this.shippingId = shippingId;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBuyerNick() {
		return buyerNick;
	}
	public void setBuyerNick(String buyerNick) {
		this.buyerNick = buyerNick;
	}
	public Integer getBuyerRate() {
		return buyerRate;
	}
	public void setBuyerRate(Integer buyerRate) {
		this.buyerRate = buyerRate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", prodId=" + prodId + ", prodImgurl=" + prodImgurl + ", prodNum=" + prodNum
				+ ", payMoney=" + payMoney + ", distribution=" + distribution + ", postFee=" + postFee + ", endTime="
				+ endTime + ", payMonent=" + payMonent + ", shippingName=" + shippingName + ", shippingId=" + shippingId
				+ ", userReceiver=" + userReceiver + ", userPhone=" + userPhone + ", userProvince=" + userProvince
				+ ", userCity=" + userCity + ", userDistrict=" + userDistrict + ", userAddress=" + userAddress
				+ ", userId=" + userId + ", buyerNick=" + buyerNick + ", buyerRate=" + buyerRate + ", status=" + status
				+ ", payStatus=" + payStatus + ", created=" + created + ", updated=" + updated + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
