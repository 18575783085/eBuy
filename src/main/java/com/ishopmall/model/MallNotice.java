package com.ishopmall.model;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 描述：
 * 商城的公告
 *
 * @author JAM
 * @create 2017年11月21日17:09:17
 **/
@Component
public class MallNotice {
    private Integer noticeId;
    private Integer noticeType;
    private Integer noticeState;
    private String noticeTitle;
    private String noticeWrite;
    private Date noticeTime;

    public Date getNoticeTime() {
		return noticeTime;
	}

	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}

	public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public Integer getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(Integer noticeType) {
        this.noticeType = noticeType;
    }

    public Integer getNoticeState() {
        return noticeState;
    }

    public void setNoticeState(Integer noticeState) {
        this.noticeState = noticeState;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeWrite() {
        return noticeWrite;
    }

    public void setNoticeWrite(String noticeWrite) {
        this.noticeWrite = noticeWrite;
    }

    @Override
    public String toString() {
        return "MallNotice{" +
                "noticeId=" + noticeId +
                ", noticeType=" + noticeType +
                ", noticeState=" + noticeState +
                ", noticeTime=" + noticeTime +
                ", noticeTitle='" + noticeTitle + '\'' +
                ", noticeWrite='" + noticeWrite + '\'' +
                '}';
    }
}
