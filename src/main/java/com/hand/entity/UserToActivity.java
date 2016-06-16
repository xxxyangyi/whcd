package com.hand.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity(name="usertoactivity")
public class UserToActivity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade=CascadeType.ALL)           
    @JoinColumn(name="user_id") 
	private User user_id;
	
	@ManyToOne(cascade=CascadeType.ALL)           
    @JoinColumn(name="activity_id") 
	private Activity activity_id;
	
	@Column(name="votefor")
	private String votefor;
	
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

	public String getVotefor() {
		return votefor;
	}

	public void setVotefor(String votefor) {
		this.votefor = votefor;
	}








	

	
	
	

	
	



}

