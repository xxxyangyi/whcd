package com.hand.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.google.gson.annotations.Expose;

import javax.persistence.*;

@Entity(name="activity")
public class Activity implements Serializable {
	
	@Id
	@Column(name="id")
	@GeneratedValue
	@Expose
	private int id;
	
	@Column(name="activityName")
	@Expose
	private String activityName;
	
	@Column(name="context")
	@Expose 
	private String context;
	
	@Column(name="createTime", columnDefinition="DATE")
	@Expose 
	private Date createTime = new Date();
	
	@Column(name="startTime", columnDefinition="DATE")
	@Expose 
	private Date startTime;
	
	@Column(name="endTime", columnDefinition="DATE")
	@Expose 
	private Date endTime;
	
	@Column(name="weight")
	@Expose 
	private Double weight = 0.6;
	
	@Column(name="userNum")
	@Expose 
	private int userNum = 0;
	
	@Column(name="expertNum")
	@Expose 
	private int expertNum = 0;
	
	@OneToMany(mappedBy = "activity_id", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
	private Set<UserToActivity> userToActivity  =new HashSet<UserToActivity>();
	
	
	@OneToMany(mappedBy = "activity_id", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
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
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getExpertNum() {
		return expertNum;
	}
	public void setExpertNum(int expertNum) {
		this.expertNum = expertNum;
	}

	@Override
	public String toString() {
		return "Activity{" +
				"id=" + id +
				'}';
	}
}
