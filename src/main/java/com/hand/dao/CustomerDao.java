package com.hand.dao;

import java.util.List;

import com.hand.entity.Customer;

public interface CustomerDao {
	
	public Customer SeleCustomer(Customer cus);
	public Customer seleCustomer(int id);
	public boolean addCustomer(Customer cus);//(有点儿问题)
	public List<Customer> infoCustomer();
	public void deleCustomer(Customer cus);
	public void editCustomer(Customer cus);

}
