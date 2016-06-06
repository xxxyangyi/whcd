package com.hand.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IUserDao;
import com.hand.entity.User;
import com.hand.service.IUserService;

@Transactional
@Service("userService")
public class UserService implements IUserService  {
	
	@Resource(name="userDao")
	private IUserDao userDao;
	
	public void AddUser(User user){
		System.out.println("------------------------"+user.getName());
		userDao.Create(user);
	}
	
}
