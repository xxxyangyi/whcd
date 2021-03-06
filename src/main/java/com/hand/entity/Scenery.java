package com.hand.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.google.gson.annotations.Expose;

@Entity(name="scenery")
public class Scenery implements Serializable{
	@Id
	@Column(name="id")
	@Expose 
	private String id;
	
	@Column(name="summary",columnDefinition="TEXT")
	@Expose 
	private String summary;
	
	@Column(name="detail",columnDefinition="TEXT")
	@Expose 
	private String detail;
	
	@Column(name="picaddr")
	@Expose 
	private String picaddr;
	
	@Column(name="createdate")
	@Expose 
	private Date createDate = new Date();
	
	@Column(name="detailsub",columnDefinition="TEXT")
	@Expose
	private String detailSub;
	
	@ManyToOne          
    @JoinColumn(name="user_id",referencedColumnName ="mail")
	@Expose
	private User user_id;
	
	@ManyToOne
	@Expose
	@JoinColumn(name="tab_id",referencedColumnName ="id")
	private Tab tab_id;
	
	@Column(name="isaudited")
	@Expose
	private Integer isAudited;

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

	public User getUser_id() {
		return user_id;
	}

	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getDetailSub() {
		return detailSub;
	}

	public void setDetailSub(String detailSub) {
		this.detailSub = detailSub;
	}

	public Integer getIsAudited() {
		return isAudited;
	}

	public void setIsAudited(Integer isAudited) {
		this.isAudited = isAudited;
	}

	public Tab getTab_id() {
		return tab_id;
	}

	public void setTab_id(Tab tab_id) {
		this.tab_id = tab_id;
	}
	
}