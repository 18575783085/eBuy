package com.ishopmall.model;
/**
 * 商品订单表
 * @author OYE
 *
 */
public class OrderItem {
	
	/**
	 * 序号
	 */
	private Integer id;
	/**
	 * 订单id
	 */
	private String orderId;
	/**
	 * 商品id
	 */
	private String prodId;
	/**
	 * 订单商品数量
	 */
	private Integer prodNum;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public Integer getProdNum() {
		return prodNum;
	}
	public void setProdNum(Integer prodNum) {
		this.prodNum = prodNum;
	}
	
	
	

}
