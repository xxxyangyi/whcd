package com.hand.actions;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.hand.entity.Scenery;
import com.hand.service.ISceneryService;
import com.opensymphony.xwork2.ActionSupport;

public class SceneryAction extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware {
	
	private static Integer numPage=2;
	
	public Map session;
	public HttpServletRequest request;
	public HttpServletResponse response;
	
	@Resource(name = "sceneryService")
	private ISceneryService sceneryService;
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public String SceneryList() {
		String sqlSum="select count(*) as sumkey from scenery order by createdate";
		String sql="select * from scenery order by createdate";
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, 1, numPage, total);
		HttpServletRequest request=ServletActionContext.getRequest();
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", 1);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "sceneryList";
	}

	public String SceneryListSub() {
		
		String sqlSum="select count(*) as sumkey from scenery where user_id='"+123+"' order by createdate";
		String sql="select * from scenery where user_id='"+123+"' order by createdate";
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String pageStr=request.getParameter("page");
		Integer page=Integer.parseInt(pageStr);
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, page, numPage, total);
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", page);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "sceneryListSub";
	}
	
	public String SceneryDetail(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "sceneryDetail";
	}
	
}
