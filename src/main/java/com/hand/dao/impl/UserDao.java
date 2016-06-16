package com.hand.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.hand.dao.IUserDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.dao.common.IOperation;
import com.hand.entity.User;

@Repository("userDao")
public class UserDao extends AbstractHibernateDao<User> implements IUserDao {
	public UserDao() {
		super();
		setClazz(User.class);
	}
}
