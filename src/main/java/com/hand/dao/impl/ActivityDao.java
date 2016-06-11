package com.hand.dao.impl;
import org.springframework.stereotype.Repository;
import com.hand.dao.IActivityDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.Activity;

@Repository("activityDao")
public class ActivityDao extends AbstractHibernateDao<Activity> implements IActivityDao {
	public ActivityDao() {
		super();
		setClazz(Activity.class);
	}
}
