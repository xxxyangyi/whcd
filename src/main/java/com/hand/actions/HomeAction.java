
package com.hand.actions;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hand.entity.User;
import com.hand.entity.UserToActivity;
import com.hand.service.IUserService;
import com.hand.service.impl.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	@Resource(name = "userService")
	private IUserService userService;

	public String Index() {
		User user = new User();
		Set<UserToActivity> userToActivity  =new HashSet<UserToActivity>();
		UserToActivity uTa = new UserToActivity();
		user.setMail("1234567");
		user.setName("yangyangyang1");
		uTa.setUser_id(user);
		userToActivity.add(uTa);
		user.setUserToActivity(userToActivity);
		userService.AddUser(user);
		
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
			String mail = request.getParameter("mail");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			Integer identity = Integer.parseInt(request
					.getParameter("identity"));
			Integer sex = Integer.parseInt(request.getParameter("sex"));

			User user = new User();
			user.setMail(mail);
			user.setName(name);
			user.setPassword(password);
			user.setIdentity(identity);
			user.setSex(sex);
			
			userService.AddUser(user);
			
			Map session=ActionContext.getContext().getSession();
			session.put("user",user);

			return "success";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "failed";
		}
	}
	public String DoLogin(){
		
		return "";
	}
}

