package com.hand.actions;

import javax.annotation.Resource;

import com.hand.entity.User;
import com.hand.service.IUserService;
import com.hand.service.impl.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	
	@Resource(name="userService")
	private IUserService userService;
	
	public String Index(){
		User user=new User();
		user.setId("123");
		user.setName("long");
		user.setPassword("123");
		
		userService.AddUser(user);
		return "index";
	}
}
