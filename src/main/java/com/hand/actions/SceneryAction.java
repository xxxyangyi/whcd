package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import com.hand.entity.Tab;
import com.hand.paging.Pager;
import com.hand.paging.PagingService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.entity.Scenery;
import com.hand.entity.User;
import com.hand.service.ISceneryService;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import static com.hand.KEY.commonKey.PAGESIZE;

public class SceneryAction extends BaseAction {
	
	private static Integer numPage=4;

	@Resource(name = "sceneryService")
	private ISceneryService sceneryService;

	@Resource(name = "pagingService")
	private PagingService<Scenery> pagingSceneryService;

	public void  pagingScenery() throws IOException{

		String tabId = request.getParameter("tabId");
		int pageNo = Integer.parseInt(request.getParameter("PageNo"));
		System.out.println("pagingScenery ：tabId "+tabId +"  pageNo " +pageNo);
		pagingSceneryService.PagingService(Scenery.class);
		Pager pager = null;
		if(tabId != null && tabId != ""){
			int tabIdInt = Integer.parseInt(tabId);
			Tab tab = new Tab();
			tab.setId(tabIdInt);
			Criterion criterion = null;
			criterion = Restrictions.eq("tab_id",tab);
			pager = pagingSceneryService.paging(pageNo,PAGESIZE,criterion);
		}else {
			pager = pagingSceneryService.paging(pageNo,PAGESIZE);
		}
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(pager));
		System.out.println("发送数据=="+gson.toJson(pager));

	}
	
	public String SceneryDetail(){
		
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "sceneryDetail";
	}
	
	public void getSceneryList() throws Exception{
		System.out.println("getSceneryList");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String isMe = request.getParameter("me");
		String str = null;
		if( "true".equals(isMe) ){
			if(session.get("user") != null){
				String userMail = ((User)session.get("user")).getMail();
				str = "SELECT * FROM scenery where user_id = \""+userMail+"\" order by createdate DESC";
			}else {
				return;
			}
		}else{
			 str = "SELECT * FROM scenery order by createdate DESC";
		}
		pagingSceneryService.PagingService(Scenery.class);
		Pager pager = pagingSceneryService.findPageBySQL(pageNo,PAGESIZE,str);

		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("数据："+pager.toString());

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(pager));
		System.out.println("发送数据=="+gson.toJson(pager));
	}

	public void deleteScenery() throws Exception {
		String sceneryId = request.getParameter("sceneryId");
		Scenery scenery = sceneryService.GetScenery(sceneryId);
		sceneryService.DeleteScenery(scenery);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("删除成功");
	}

	public void auditScenery() throws Exception {
		String sceneryId = request.getParameter("sceneryId");
		Scenery scenery = sceneryService.GetScenery(sceneryId);
		scenery.setIsAudited(1);
		sceneryService.UpdateScenery(scenery);
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("通过成功");
	}

	public void disAuditScenery() throws Exception {
		String sceneryId = request.getParameter("sceneryId");
		Scenery scenery = sceneryService.GetScenery(sceneryId);
		scenery.setIsAudited(-1);
		sceneryService.UpdateScenery(scenery);

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("不通过成功");
	}
   
}
