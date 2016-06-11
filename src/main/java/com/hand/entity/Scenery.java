package com.hand.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="scenery")
public class Scenery implements Serializable{
	@Id
	@Column(name="id")
	private String id;
	
	@Column(name="summary")
	private String summary;
	
	@Column(name="detail")
	private String detail;
	
	@Column(name="picaddr")
	private String picaddr;
	
	@Column(name="createdate")
	private Date createDate;
	
	@ManyToOne          
    @JoinColumn(name="user_id",referencedColumnName ="mail") 
	private User user_id;

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
	
	
}
