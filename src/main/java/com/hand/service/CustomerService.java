package com.hand.service;

import java.util.List;

import com.hand.entity.Customer;

public interface CustomerService {
	
	public boolean checkLogin(Customer cus);
	public Customer seleCustomer(int id);
	public boolean addCustomer(Customer cus);
	public List<Customer> infoCustomer();
	public void deleCustomer(Customer cus);
	public void editCustomer(Customer cus);
}
