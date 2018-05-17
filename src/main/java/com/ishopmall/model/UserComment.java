package com.ishopmall.model;

import java.util.Date;


public class UserComment {
	private String commentId;
	private String prodId;
	private ProdsInfo prodsInfo;
	private String userId;
	private String content;
	private Integer  status;
	private Date contentTime;
	private Integer evaluation;
	
	public String getProdId() {
		return prodId;
	}
	public void setProdId(String prodId) {
		this.prodId = prodId;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public ProdsInfo getProdsInfo() {
		return prodsInfo;
	}
	public void setProdsInfo(ProdsInfo prodsInfo) {
		this.prodsInfo = prodsInfo;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
		return "UserComment [commentId=" + commentId + ", prodId=" + prodId
				+ ", prodsInfo=" + prodsInfo + ", userId=" + userId
				+ ", content=" + content + ", status=" + status
				+ ", contentTime=" + contentTime + ", evaluation=" + evaluation
				+ "]";
	}
	
	
}
