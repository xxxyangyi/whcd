package com.hand;

import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.hand.entity.Customer;
import com.hand.service.CustomerService;

public class Test {
	private CustomerService customerService;
//	private ChangeToJson changeToJson;

	//===================================================================================
	public static void main( String[] args )
	{
		Customer cus = new Customer();
		cus.setFirst_name("yang");
		cus.setLast_name("SMITH");
		cus.setActive(false);
		cus.setAddress_id(12);
		cus.setCreate_date(new Date());
		cus.setEmail("123456");
		//cus.setLast_update(new Date());
		cus.setStore_id(1);

		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		Test test =(Test) ctx.getBean("app");
		//System.out.println(test.customerService.seleCustomer(2));

		//test.customerService.checkLogin(cus);

		//test.customerService.addCustomer(cus);

		//System.out.println(test.customerService.infoCustomer().size()+"   "+test.customerService.infoCustomer());
		cus.setCustomer_id(607);
		//test.customerService.deleCustomer(cus);
		cus.setFirst_name("oooooooo");
		//test.customerService.editCustomer(cus);
		//		
		//		ChangeToJson tj= new ChangeToJson();
		//		tj.toJson();
		//test.changeToJson.toJson();





	}

	//=============GET 和  SET 方法====================================================
	public CustomerService getCustomerService() {
		return customerService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
//	public ChangeToJson getChangeToJson() {
//		return changeToJson;
//	}
//
//	public void setChangeToJson(ChangeToJson changeToJson) {
//		this.changeToJson = changeToJson;
//	}


}
