package com.hand.service;

import java.util.List;
import com.hand.entity.Activity;
public interface IActivityService{
	/***
	 * 添加用户
	 * @param activity
	 */
	public void AddActivity(Activity activity);
	
	/**
	 * 获取活动
	 * @param id 活动id
	 * @return 活动对象
	 */
	public Activity GetActivity(int id);
	
	public List<Activity> GetActivitys();
}
