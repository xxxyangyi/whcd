package com.hand.dao.impl;


import org.springframework.stereotype.Repository;
import com.hand.dao.IUserToActivityDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.UserToActivity;

@Repository("userToActivityDao")
public class UserToActivityDao extends AbstractHibernateDao<UserToActivity> implements IUserToActivityDao {
	public UserToActivityDao() {
		super();
		setClazz(UserToActivity.class);
	}
}
