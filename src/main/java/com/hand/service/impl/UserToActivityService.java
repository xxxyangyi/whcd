package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IUserToActivityDao;
import com.hand.dao.impl.UserToActivityDao;
import com.hand.entity.UserToActivity;
import com.hand.service.IUserToActivityService;

@Transactional
@Service("userToActivityService")
public class UserToActivityService implements IUserToActivityService {

	@Resource(name = "userToActivityDao")
	private IUserToActivityDao userToActivityDao;

	@Override
	public void AddUserToActivity(UserToActivity userToActivity) {
		userToActivityDao.Create(userToActivity);
	}

	@Override
	public UserToActivity GetUserToActivity(int id) {
		return userToActivityDao.FindOne(id);
	}

	@Override
	public List<UserToActivity> FindBySQL(String str) {
		return userToActivityDao.FindBySQL(str);
	}

	@Override
	public UserToActivity Update(UserToActivity userToActivity) {
		return userToActivityDao.Update(userToActivity);
		
	}


}
