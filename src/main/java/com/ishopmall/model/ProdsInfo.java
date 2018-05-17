package com.ishopmall.model;

import java.util.Date;

public class ProdsInfo {
	private String id;
	private String classId;
	private String name;
	private String title;
	private Double salePrice;
	private Double promotionPrice;
	private Integer prodsNum;
	private Integer saleNum;
	private String imgurl;
	private String remark;
	private Date created;
	private Date updated;
	private Integer status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}
	public Double getPromotionPrice() {
		return promotionPrice;
	}
	public void setPromotionPrice(Double promotionPrice) {
		this.promotionPrice = promotionPrice;
	}
	public Integer getProdsNum() {
		return prodsNum;
	}
	public void setProdsNum(Integer prodsNum) {
		this.prodsNum = prodsNum;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ProdsInfo [id=" + id + ", classId=" + classId + ", name="
				+ name + ", title=" + title + ", salePrice=" + salePrice
				+ ", promotionPrice=" + promotionPrice + ", prodsNum="
				+ prodsNum + ", saleNum=" + saleNum + ", imgurl=" + imgurl
				+ ", remark=" + remark + ", created=" + created + ", updated="
				+ updated + ", status=" + status + "]";
	}
}
