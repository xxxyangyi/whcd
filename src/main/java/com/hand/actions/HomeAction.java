package com.hand.actions;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hand.entity.User;
import com.hand.service.IUserService;
import com.hand.service.impl.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	@Resource(name = "userService")
	private IUserService userService;

	public String Index() {
		User user = new User();
		user.setId("123");
		user.setName("long");
		user.setPassword("123");

		// userService.AddUser(user);
		return "index";
	}

	/***
	 * 注册界面
	 * 
	 * @return 返回注册视图
	 */
	public String Resister() {
		return "resister";
	}

	public String DoResister() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String id = request.getParameter("mail");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			Integer identity = Integer.parseInt(request
					.getParameter("identity"));
			Integer sex = Integer.parseInt(request.getParameter("sex"));

			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setPassword(password);
			user.setIdentity(identity);
			user.setSex(sex);
			
			userService.AddUser(user);
			
			return "success";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "failed";
		}
	}
}
