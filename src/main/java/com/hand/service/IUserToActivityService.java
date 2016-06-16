package com.hand.service;

import java.util.List;

import com.hand.entity.UserToActivity;
public interface IUserToActivityService{
	public void AddUserToActivity(UserToActivity userToActivity);
	public UserToActivity GetUserToActivity(int id);
	public List<UserToActivity> FindBySQL(String str);
	public UserToActivity Update(UserToActivity userToActivity);
}
