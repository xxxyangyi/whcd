package com.hand.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.*;

@Entity(name="usertoactivity")
public class UserToActivity implements Serializable {
	@Id
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade={CascadeType.ALL})           
    @JoinColumn(name="user_id") 
	private User user_id;

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


	
//	@Column(name="active_id")
//	private int active_id;
//	
//	@Column(name="votefor")
//	private int votefor;
	
	



}

