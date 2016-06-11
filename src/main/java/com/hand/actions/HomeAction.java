package com.hand.actions;

import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.hand.entity.User;
import com.hand.service.IUserService;
import com.hand.service.impl.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {

	@Resource(name = "userService")
	private IUserService userService;

	public String Index() {
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
	
	
	public void DoLogin(){
		try{
		System.out.println("++++++++++++++++++++++++++++++++++");
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		if(userService.IsUserExisted(mail, password)){
			//System.out.println("++++++++++++++++++++++++++++++++++ mail:"+mail);
			//System.out.println("++++++++++++++++++++++++++++++++++  password:"+password);;
			User user=userService.GetUser(mail);
			Map session=ActionContext.getContext().getSession();
			session.put("user",user);
			out.print(1);
		}
		else
			out.print(0);
		
	}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void DoLogOut(){
		try{
			Map session=ActionContext.getContext().getSession();
			session.remove("user");
			HttpServletResponse response=ServletActionContext.getResponse();
			PrintWriter out = response.getWriter();
			out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
