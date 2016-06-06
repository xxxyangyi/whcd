package com.hand.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IUserDao;
import com.hand.entity.User;

@Transactional
@Service
public class UserService {
	
	@Resource(name="userDao")
	private IUserDao userDao;
	
	public void AddUser(User user){
		userDao.Create(user);
	}
	
}
