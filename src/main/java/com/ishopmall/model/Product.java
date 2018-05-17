package com.ishopmall.model;

import java.util.Date;

/**
 * 商品信息
 * @author JAM
 * 2017年11月24日16:57:51
 */
public class Product {
    private String id;
    private String classId;
    private String name;
    private String title;
    private Double salePrice;
    private Double promotionPrice;
    private Integer prodsNum;
    private Integer saleNum;
    private String imgUrl;
    private String remark;
    private Date creatTime;
    private Date updateTime;
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

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", classId='" + classId + '\'' +
                ", name='" + name + '\'' +
                ", title='" + title + '\'' +
                ", salePrice=" + salePrice +
                ", promotionPrice=" + promotionPrice +
                ", prodsNum=" + prodsNum +
                ", saleNum=" + saleNum +
                ", imgUrl='" + imgUrl + '\'' +
                ", remark='" + remark + '\'' +
                ", creatTime=" + creatTime +
                ", updateTime=" + updateTime +
                ", status=" + status +
                '}';
    }
}
