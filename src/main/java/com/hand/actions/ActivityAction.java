package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.entity.Activity;
import com.hand.entity.Vote;
import com.hand.service.IActivityService;
import com.opensymphony.xwork2.ActionSupport;

public class ActivityAction extends ActionSupport implements SessionAware,ServletRequestAware,ServletResponseAware{
	
	@Resource(name = "activityService")
	private IActivityService activityService;
	
	private Map session;
	private HttpServletRequest  request;
	private HttpServletResponse response;
	private Activity activity;
	private String time1;
	private String time2;
	
	
	public void Index() {
		Activity activity = new Activity();
		System.out.println(activity.getEndTime());
		activity.setActivityName("这是第一个活动");
		
		activityService.AddActivity(activity);
	}
	
	public String activityAdd() throws ParseException{
		System.out.println("===========activityAdd");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String startTime = request.getParameter("time1");
		String endTime = request.getParameter("time2");		
		activity.setStartTime(sdf.parse(startTime));
		activity.setEndTime(sdf.parse(endTime));	
		activityService.AddActivity(activity);
		System.out.println("+++++++++++添加成功！");
		return "success";
	}
	
	public void getActivitys() throws IOException {
		System.out.println("=============getActivitys");
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();  
		List<Activity> activitys=activityService.GetActivitys();
		System.out.println(activitys.size());
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(activitys));
		System.out.println("发送数据");
	}
	
	
	public String getActivityVotes() throws IOException {
		System.out.println("=============getActivityVotes");
		int activity_id = Integer.parseInt(request.getParameter("activity_id"));
		activity = activityService.GetActivity(activity_id);
		return "success";
	}
	
	public String getActivityById() {
		System.out.println("=============getActivityById");
		int activity_id = Integer.parseInt(request.getParameter("activity_id"));
		activity = activityService.GetActivity(activity_id);
		return "success";
	}
	
	
	
	
	
	
	
	
	
/////////////////get set 方法//////////////////////////////////////////////////////////////////////////
	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}


	
	
	
}