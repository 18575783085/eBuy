package com.ishopmall.model;

import java.util.Date;
import java.util.List;

/**
 * 商品评论实体类
 * @author JAM
 * 2017年11月26日11:37:03
 */
public class ProductComment {
    private Integer id;
    private String prodId;
    private String userId;
    private String content;
    private Integer status;
    private Date contentTime;
    private Integer evaluation;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getContentTime() {
        return contentTime;
    }

    public void setContentTime(Date contentTime) {
        this.contentTime = contentTime;
    }

    public Integer getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Integer evaluation) {
        this.evaluation = evaluation;
    }

    @Override
    public String toString() {
        return "ProductComment{" +
                "id=" + id +
                ", prodId='" + prodId + '\'' +
                ", userId='" + userId + '\'' +
                ", content='" + content + '\'' +
                ", status=" + status +
                ", contentTime=" + contentTime +
                ", evaluation=" + evaluation +
                '}';
    }
}
