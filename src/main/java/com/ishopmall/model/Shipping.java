package com.ishopmall.model;
/**
 * 物流方式
 * @author OYE
 *
 */
public class Shipping {

	/**
	 * 物流id
	 */
	private Integer id;
	/**
	 * 物流名称
	 */
	private String name;
	/**
	 * 快递费
	 */
	private Integer postFee;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPostFee() {
		return postFee;
	}
	public void setPostFee(Integer postFee) {
		this.postFee = postFee;
	}
	
	
	
	
	
}
