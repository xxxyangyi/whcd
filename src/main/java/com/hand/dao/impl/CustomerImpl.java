package com.hand.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.hand.dao.CustomerDao;
import com.hand.entity.Customer;

public class CustomerImpl implements CustomerDao{


	@Override
	public Customer SeleCustomer(Customer cus) {

		Criteria cr = getSession().createCriteria(Customer.class);
		Criterion c1 =Restrictions.eq("first_name", cus.getFirst_name());
		Criterion c2 =Restrictions.eq("last_name", cus.getLast_name());
		Criterion c3 =Restrictions.and(c1, c2);
		cr.add(c1);
		List<Customer> list = cr.list();
		return list.get(0);
	}


	@Override
	public Customer seleCustomer(int id) {
		return (Customer) getSession().get(Customer.class, id);		
	}



	@Override
	public boolean addCustomer(Customer cus) {
		
		cus.setActive(false);
		cus.setStore_id(1);
		cus.setCreate_date(new Date());
		cus.setLast_update(new Date());
		getSession().save(cus);//返回值是存储事务的主键
		System.out.println("========添加成功========");
		
		Customer cus1 =  (Customer) getSession().get(Customer.class, cus.getCustomer_id());
		System.out.println("已经保存的数据如下：");
		System.out.println("ID: " +cus1.getCustomer_id());
		System.out.println("FirstName: " +cus1.getFirst_name());
		System.out.println("LastName: " +cus1.getLast_name());
		System.out.println("Email: " +cus1.getEmail());
		System.out.println("Address: " +cus1.getAddress_id());
		return true;
	}

	@Override
	public List<Customer> infoCustomer() {
		
		Criteria cr = getSession().createCriteria(Customer.class);
		List<Customer> list = cr.list();
		return list;
	}

	@Override
	public void deleCustomer(Customer cus) {
		Customer cus1=(Customer)getSession().get(Customer.class,cus.getCustomer_id());
		getSession().delete(cus1);
	}

	@Override
	public void editCustomer(Customer cus) {
		Customer cus1=(Customer)getSession().get(Customer.class,cus.getCustomer_id());
		cus1.setAddress_id(cus.getAddress_id());
		cus1.setEmail(cus.getEmail());
		cus1.setFirst_name(cus.getFirst_name());
		cus1.setLast_name(cus.getLast_name());
		getSession().update(cus1);
	}



	private SessionFactory sessionFactory;
	//================== SessionFactory 的 get set 方法==============================
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	//----------------------------------------------------------------------------
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public void setSession(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}









}
