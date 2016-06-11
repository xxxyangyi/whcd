package com.hand.dao.common;

import java.io.Serializable;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@SuppressWarnings("unchecked")
public abstract class AbstractHibernateDao<T extends Serializable> implements
		IOperation<T> {
	private Class<T> clazz;
	//private final Logger log=Logger.getLogger(AbstractHibernateDao.class);
	
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected final void setClazz(final Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}
	

	public T FindOne(Object id) {
		// TODO Auto-generated method stub
		return (T) getCurrentSession().get(clazz, (Serializable) id);
	}

	public List<T> FindAll() {
		// TODO Auto-generated method stub
		return getCurrentSession().createQuery("from " + clazz.getName()).list();
	}
	
	public List<T> FindBySQL(String str){
		List<T> list = getCurrentSession().createSQLQuery(str).addEntity(clazz).list();
		return list;
	}

	public void Create(T model) {
		// TODO Auto-generated method stub
		// getCurrentSession().saveOrUpdate(model);
		System.out.println("------------------------"+model.toString());
		getCurrentSession().merge(model);
	}

	public T Update(T model) {
		// TODO Auto-generated method stub
		getCurrentSession().update(model);
		return model;
	}

	public void Delete(T model) {
		// TODO Auto-generated method stub
		getCurrentSession().delete(model);
	}
	
}
