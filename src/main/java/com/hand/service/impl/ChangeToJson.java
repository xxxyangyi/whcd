package com.hand.service.impl;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hand.entity.Customer;
import com.hand.service.CustomerService;

public class ChangeToJson {
	private CustomerService customerService;
	
	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public Object toJson(){
		JsonObject object = new JsonObject();
		JsonArray array = new JsonArray();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		List<Customer> list = customerService.infoCustomer();
		
		Iterator<Customer> it = list.iterator();
		while(it.hasNext()){
			Customer customer = new Customer();
			customer = it.next();
			JsonObject jo = new JsonObject();
			jo.addProperty("customer_id", customer.getCustomer_id());
			jo.addProperty("store_id", customer.getStore_id());
			jo.addProperty("first_name", customer.getFirst_name());
			jo.addProperty("last_name", customer.getLast_name());
			jo.addProperty("email", customer.getEmail());
			jo.addProperty("address", customer.getAddress_id());
			jo.addProperty("customer_id", customer.getCustomer_id());
			jo.addProperty("last_update", sdf.format(customer.getLast_update()));
			jo.addProperty("age1", "age1");
			array.add(jo);//将一个普通对象，添加到数组中		
		}		
		object.add("Customer", array);//向文件中添加数组元素
		return object;
	}

}
