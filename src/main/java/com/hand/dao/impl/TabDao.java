package com.hand.dao.impl;

import org.springframework.stereotype.Repository;

import com.hand.dao.ITabDao;
import com.hand.dao.common.AbstractHibernateDao;
import com.hand.entity.Tab;

@Repository("tabDao")
public class TabDao extends AbstractHibernateDao<Tab> implements ITabDao {
	public TabDao() {
		super();
		setClazz(Tab.class);
	}
}
