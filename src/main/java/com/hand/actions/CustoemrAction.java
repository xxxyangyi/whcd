package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.hand.entity.Customer;

import com.hand.service.CustomerService;
import com.hand.service.impl.ChangeToJson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustoemrAction  extends ActionSupport {

	private Customer cus;	
	private CustomerService customerService;

	private ChangeToJson changeToJson;
	private Map session;

	private Object object =new Object();

	//======================登录验证=============================================
	public String checkLogin() {	
		System.out.println("====action==登录");
		if (customerService.checkLogin(cus)) {
			System.out.println("====action==登录成功");
			session = ActionContext.getContext().getSession();
			session.put("loginSign", "loginSuccess");
			return "loginSuccess";
		} else {
			return "loginFailure";
		}
	}
	//====================返会json 数据============================================
	public void infoCustomer() throws IOException {
		System.out.println("=======info======");
		HttpServletResponse response = ServletActionContext.getResponse();  
		PrintWriter out = response.getWriter();  
		Object state = changeToJson.toJson();
		out.print(state);
	}
	//==================添加 Customer ==============================================
	public void addCustomer() throws IOException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		System.out.println("==========add=========");
		String first_name = request.getParameter("first_name");
		String last_name= request.getParameter("last_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		System.out.println(first_name+" "+last_name+" "+email+" "+address);
		Customer cus=new Customer();
		cus.setFirst_name(first_name);
		cus.setLast_name(last_name);
		cus.setEmail(email);
		cus.setAddress_id(1);
		System.out.println("ces"+cus);
		customerService.addCustomer(cus);		
		PrintWriter out = response.getWriter();  
		int state =1;
		out.print(state);
	}
	//================删除Custtoemr==============================================
	public void deleCustomer() throws IOException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		System.out.println("==========dele=========");
		int customer_id =Integer.parseInt(request.getParameter("customer_id"));	
		System.out.println("删除的id : "+customer_id);
		Customer cus=new Customer();
		cus.setCustomer_id(customer_id);
		customerService.deleCustomer(cus);	
		PrintWriter out = response.getWriter();  
		int state =1;
		out.print(state);
	}
	//================更新Custtoemr==============================================
	public void editCustomer() throws IOException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		System.out.println("==========edit=========");
		int customer_id =Integer.parseInt(request.getParameter("customer_id"));
		String first_name = request.getParameter("first_name");
		String last_name= request.getParameter("last_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		System.out.println("更新的id : "+customer_id);
		Customer cus=new Customer();
		cus.setCustomer_id(customer_id);
		cus.setFirst_name(first_name);
		cus.setLast_name(last_name);
		cus.setEmail(email);
		cus.setAddress_id(1);
		customerService.editCustomer(cus);
		PrintWriter out = response.getWriter();  
		int state =1;
		out.print(state);
	}












	// =======get 和  set 方法==================
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public Customer getCus() {
		return cus;
	}
	public void setCus(Customer cus) {
		this.cus = cus;
	}
	public CustomerService getCustomerService() {
		return customerService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	public ChangeToJson getChangeToJson() {
		return changeToJson;
	}
	public void setChangeToJson(ChangeToJson changeToJson) {
		this.changeToJson = changeToJson;
	}

}
