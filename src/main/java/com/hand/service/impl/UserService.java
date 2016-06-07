package com.hand.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.IUserDao;
import com.hand.entity.User;
import com.hand.service.IUserService;

@Transactional
@Service("userService")
public class UserService implements IUserService {

	@Resource(name = "userDao")
	private IUserDao userDao;

	@Override
	public void AddUser(User user) {
		userDao.Create(user);
	}

	@Override
	public User GetUser(String mail) {
		return userDao.FindOne(mail);
	}

	@Override
	public boolean IsUserExisted(String mail,String password) {
		// TODO Auto-generated method stub
		try {
			User user=GetUser(mail);
			
			if(user!=null&&user.getPassword().equals(password))
					return true;
			return false;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
