/*package com.hand.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hand.dao.CustomerDao;
import com.hand.entity.Customer;
import com.hand.service.CustomerService;

public class CustomerServiceImpl implements CustomerService {

	//===================获取 Customer 单一的一个实例=================================
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public Customer seleCustomer(int id) {
		System.out.println("======进入select impl======");
		
		return customerDao.seleCustomer(id);
	}
	//==================checkLogin 检查 first_name\last_name  判断是否可以登录
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public boolean checkLogin(Customer cus) {
		System.out.println("=====进入checLogin============");
		Customer cus1 = customerDao.SeleCustomer(cus);
		if(cus1!=null){
			System.out.println("=====登录成功============"+cus1);
			return true;
		}else{
			System.out.println("=====登录失败============");
			return false;
		}
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean addCustomer(Customer cus) {
		System.out.println("=====add========");
		return customerDao.addCustomer(cus);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public List<Customer> infoCustomer() {
		System.out.println("====info=====");
		return customerDao.infoCustomer();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void deleCustomer(Customer cus) {
		System.out.println("=========dele=======");
		customerDao.deleCustomer(cus);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void editCustomer(Customer cus) {
		System.out.println("=======edit====");
		customerDao.editCustomer(cus);
	}
	
	
	
	
	private CustomerDao customerDao;
	public CustomerDao getCustomerDao() {
		return customerDao;
	}
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}



}
*/