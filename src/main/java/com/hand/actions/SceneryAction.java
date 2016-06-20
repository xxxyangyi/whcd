package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.entity.Activity;
import com.hand.entity.Scenery;
import com.hand.entity.User;
import com.hand.entity.vo.SceneryVO;
import com.hand.service.ISceneryService;
import com.hand.util.EntityToVo;
import com.opensymphony.xwork2.ActionSupport;

public class SceneryAction extends BaseAction {
	
	private static Integer numPage=2;
	
	
	@Resource(name = "sceneryService")
	private ISceneryService sceneryService;

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
	
	public void SceneryListGson() throws IOException{
		System.out.println("=============SceneryListGson");
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		List<Scenery> list = sceneryService.GetScenerys();
		System.out.println(list.size());
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(list));
		System.out.println("发送数据");
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
		
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "sceneryDetail";
	}
	
	public void getSceneryList() throws Exception{
		
		String managerParam=request.getParameter("managerParam");
		String userParam=request.getParameter("userParam");
		String sqlSum="";
		String sql="";
		if(managerParam!=null){
			 sqlSum="select count(*) as sumkey from scenery order by createdate";
			 sql="select * from scenery order by createdate";
			
		}else if(userParam!=null){
			User user=(User) session.get("user");
			String mail=user.getMail();
		
			 sqlSum="select count(*) as sumkey from scenery where user_id='"+mail+"' order by createdate";
			 sql="select * from scenery where user_id='"+mail+"' order by createdate";
			
		}else{
			String tab=request.getParameter("tabid");
			if(tab!=null){
				sqlSum="select count(*) as sumkey from scenery where isaudited=1 and tab_id="+tab+" order by createdate";
				 sql="select * from scenery where isaudited=1 and tab_id="+tab+" order by createdate";
			
			}
			else
			{
				 sqlSum="select count(*) as sumkey from scenery where isaudited=1  order by createdate";
				 sql="select * from scenery where isaudited=1 order by createdate";
			}
		}	
		
		Integer page=Integer.parseInt(request.getParameter("page"));
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, page, numPage, total);
		
		List<SceneryVO> sceneryVoList=new ArrayList<SceneryVO>();
		for(Scenery s:sceneryList)
			sceneryVoList.add(EntityToVo.SceneryToVo(s));
		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        
        Map<String, Object> paramMap=new HashMap<String,Object>();
        paramMap.put("page",page);
        paramMap.put("total",total);
        paramMap.put("numPage",numPage);
        paramMap.put("sceneryList",sceneryVoList);
		
        out.print(gson.toJson(paramMap));
	}
	
   public void getPercenCenterSceneryList() throws Exception{
		
		User user=(User) session.get("user");
		String mail=user.getMail();
	
		String sqlSum="select count(*) as sumkey from scenery where user_id='"+mail+"' order by createdate";
		String sql="select * from scenery where user_id='"+mail+"' order by createdate";
		
		
		Integer page=Integer.parseInt(request.getParameter("page"));
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, page, numPage, total);
		
		List<SceneryVO> sceneryVoList=new ArrayList<SceneryVO>();
		for(Scenery s:sceneryList)
			sceneryVoList.add(EntityToVo.SceneryToVo(s));
		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        
        Map<String, Object> paramMap=new HashMap<String,Object>();
        paramMap.put("page",page);
        paramMap.put("total",total);
        paramMap.put("numPage",numPage);
        paramMap.put("sceneryList",sceneryVoList);
		
        out.print(gson.toJson(paramMap));
	}
}
