package com.hand.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import com.google.gson.annotations.Expose;

import javax.persistence.*;

@Entity(name="activity")
public class Activity implements Serializable {
	
	public Activity(){}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	@Expose
	private int id;
	
	@Column(name="activityName")
	@Expose
	private String activityName;
	
	@Column(name="context")
	@Expose 
	private String context;
	
	@Column(name="createTime")
	@Expose 
	private Date createTime;
	
	@Column(name="startTime")
	@Expose 
	private Date startTime;
	
	@Column(name="endTime")
	@Expose 
	private Date endTime;
	
	
	@OneToMany(mappedBy = "activity_id", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<UserToActivity> userToActivity  =new HashSet<UserToActivity>();
	
	
	@OneToMany(mappedBy = "activity_id", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Vote> vote  =new HashSet<Vote>();

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Set<UserToActivity> getUserToActivity() {
		return userToActivity;
	}
	public void setUserToActivity(Set<UserToActivity> userToActivity) {
		this.userToActivity = userToActivity;
	}
	public Set<Vote> getVote() {
		return vote;
	}
	public void setVote(Set<Vote> vote) {
		this.vote = vote;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}	
}
