package com.hand.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import com.google.gson.annotations.Expose;

@Entity(name="vote")
public class Vote implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	@Expose 
	private int id;
	
	@ManyToOne(cascade={CascadeType.ALL})           
    @JoinColumn(name="user_id") 
	private User user_id;
	
	@ManyToOne(cascade=CascadeType.ALL)           
    @JoinColumn(name="activity_id") 
	private Activity activity_id;
	
	@Column(name="create_time")
	@Expose 
	private Date create_time;
	
	@Column(name="voteNum")
	@Expose 
	private int voteNum;
	
	@Column(name="expertVoteNum")
	@Expose 
	private int expertVoteNum;
	
	@Column(name="userImg")
	@Expose 
	private String userImg;
	
	@Column(name="context")
	@Expose 
	private String context;	

	public Vote() {
		this.create_time = new Date();
		this.voteNum = 0;
		this.expertVoteNum = 0;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public User getUser_id() {
		return user_id;
	}


	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}


	public Activity getActivity_id() {
		return activity_id;
	}


	public void setActivity_id(Activity activity_id) {
		this.activity_id = activity_id;
	}


	public Date getCreate_time() {
		return create_time;
	}


	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}


	public int getVoteNum() {
		return voteNum;
	}


	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}


	public int getExpertVoteNum() {
		return expertVoteNum;
	}


	public void setExpertVoteNum(int expertVoteNum) {
		this.expertVoteNum = expertVoteNum;
	}


	public String getUserImg() {
		return userImg;
	}


	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}


	public String getContext() {
		return context;
	}


	public void setContext(String context) {
		this.context = context;
	}


	@Override
	public String toString() {
		return "Vote [id=" + id + ", create_time=" + create_time + ", voteNum=" + voteNum + ", userImg=" + userImg
				+ ", context=" + context + "]";
	}


}
