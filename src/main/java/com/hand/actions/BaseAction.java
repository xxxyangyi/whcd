package com.hand.actions;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public  class BaseAction extends ActionSupport  {
	 
	 
//	 protected Map session;
//	 protected HttpServletResponse response;
//	 protected HttpServletRequest request;
//	 protected String realPath;
	 
	 
	 private static final long serialVersionUID = 1L;
	
	/**
	  * 获得request
	  * 
	  * @return
	  */
	 public HttpServletRequest getRequest() {
	  return ServletActionContext.getRequest();
	 }
	 /**
	  * 获得response
	  * 
	  * @return
	  */
	 public HttpServletResponse getResponse() {
	  return ServletActionContext.getResponse();
	 }

	 /**
	  * 获得servlet上下文
	  * 
	  * @return
	  */
	 public ServletContext getServletContext() {
	  return ServletActionContext.getServletContext();
	 }
	 public String getRealyPath(String path) {
	  return getServletContext().getRealPath(path);
	 }
	public Map getSession() {
		return ActionContext.getContext().getSession();
	}
	 
}