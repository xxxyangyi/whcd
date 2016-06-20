package com.hand.entity.vo;

import java.util.Date;

import com.google.gson.annotations.Expose;
import com.hand.entity.User;

public class SceneryVO {
	@Expose 
	private String id;
	@Expose 
	private String summary;
	@Expose 
	private String detail;
	@Expose 
	private String picaddr;
	@Expose 
	private String createDate;
	@Expose 
	private String detailSub;
	@Expose 
	private String userName;
	@Expose
	private Integer isAudited;
	@Expose
	private String type;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPicaddr() {
		return picaddr;
	}
	public void setPicaddr(String picaddr) {
		this.picaddr = picaddr;
	}
	public String getDetailSub() {
		return detailSub;
	}
	public void setDetailSub(String detailSub) {
		this.detailSub = detailSub;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Integer getIsAudited() {
		return isAudited;
	}
	public void setIsAudited(Integer isAudited) {
		this.isAudited = isAudited;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
