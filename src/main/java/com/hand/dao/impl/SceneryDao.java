package com.hand.dao.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hand.dao.ISceneryDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.Scenery;
import com.hand.entity.User;

@Repository("sceneryDao")
public class SceneryDao extends AbstractHibernateDao<Scenery> implements
		ISceneryDao {

	public SceneryDao() {
		super();
		// TODO Auto-generated constructor stub
		setClazz(Scenery.class);
	}
}
