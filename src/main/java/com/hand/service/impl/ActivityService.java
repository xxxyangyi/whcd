package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IActivityDao;
import com.hand.entity.Activity;
import com.hand.service.IActivityService;

@Transactional
@Service("activityService")
public class ActivityService implements IActivityService {

	@Resource(name = "activityDao")
	private IActivityDao activityDao;
	@Override
	public void AddActivity(Activity activity) {
		activityDao.Create(activity);
	}

	@Override
	public Activity GetActivity(int id) {
		return activityDao.FindOne(id);
	}
	@Override
	public List<Activity> GetActivitys() {		
		return activityDao.FindAll();
	}
	
	@Override
	public List<Activity> FindBySQL(String str) {
		return activityDao.FindBySQL(str);
	}

	@Override
	public Activity update(Activity activity) {
		return activityDao.Update(activity);
	}

}
