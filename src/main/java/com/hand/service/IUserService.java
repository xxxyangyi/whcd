package com.hand.service;

import com.hand.dao.common.IOperation;
import com.hand.entity.User;

public interface IUserService{
	/***
	 * 添加用户
	 * @param user
	 */
	public void AddUser(User user);
	
	/**
	 * 获取用户
	 * @param mail 用户邮箱
	 * @return 用户对象
	 */
	public User GetUser(String mail);
	/***
	 * 判断是否存在用户
	 * @param user
	 * @return 布尔值
	 */
	public boolean IsUserExisted(String mail,String password);
}
