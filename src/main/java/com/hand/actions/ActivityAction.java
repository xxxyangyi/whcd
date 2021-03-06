package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hand.paging.Pager;
import com.hand.paging.PagingService;
import org.apache.struts2.interceptor.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.entity.Activity;
import com.hand.service.IActivityService;
import com.opensymphony.xwork2.ActionSupport;

import static com.hand.KEY.commonKey.PAGESIZE;

public class ActivityAction extends BaseAction{
	
	@Resource(name = "activityService")
	private IActivityService activityService;

	@Resource(name = "pagingService")
	private PagingService<Activity> pagingActivityService;
	
	private Activity activity;
	private List<Activity> activityList;
	private String time1;
	private String time2;
	

	public void  pagingActivity() throws IOException{

		int pageNo = Integer.parseInt(request.getParameter("PageNo"));

		pagingActivityService.PagingService(Activity.class);
		Pager pager = pagingActivityService.paging(pageNo,PAGESIZE,null);

		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("数据："+pager.toString());

		for (Object activity: pager.getResult()){
			System.out.println("activity --->：  "+((Activity)activity).toString());
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(pager));
		System.out.println("发送数据=="+gson.toJson(pager));

	}



	public void Index() {
		Activity activity = new Activity();
		System.out.println(activity.getEndTime());
		activity.setActivityName("这是第一个活动");		
		activityService.AddActivity(activity);
	}
	
	// 添加活动
	public void activityAdd() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

		String activityName = request.getParameter("activityName");
		String activityContext = request.getParameter("activityContext");
		String startTime = request.getParameter("activityStartTime");
		String endTime = request.getParameter("activityEndTime");
		activity = new Activity();
		activity.setActivityName(activityName);
		activity.setContext(activityContext);
		activity.setStartTime(sdf.parse(startTime));
		activity.setEndTime(sdf.parse(endTime));
		System.out.println(activity.getVote());
		activityService.AddActivity(activity);

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		System.out.println("+++++++++++添加成功！");
		out.print("添加活动成功");
	}
	// 获取活动的信息
	public void getActivitys() throws IOException {
		System.out.println("=============getActivitys");
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		List<Activity> activitys=activityService.GetActivitys();
		System.out.println(activitys.size());
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(activitys));
		System.out.println("发送数据");
	}
	
	// 得到全部的投票
	public String getActivityVotes() throws IOException {
		System.out.println("=============getActivityVotes");
		int activity_id = Integer.parseInt(request.getParameter("activity_id"));
		activity = activityService.GetActivity(activity_id);
		return "success";
	}

	// 管理员获取活动的信息
	public void getActivitysOrderByCreateTime() throws IOException {
		System.out.println("getActivitysOrderByCreateTime");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String str = "SELECT * FROM activity order by createTime DESC";
		pagingActivityService.PagingService(Activity.class);
		Pager pager = pagingActivityService.findPageBySQL(pageNo,PAGESIZE,str);

		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("数据："+pager.toString());

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
		out.print(gson.toJson(pager));
		System.out.println("发送数据=="+gson.toJson(pager));
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

	public List<Activity> getActivityList() {
		return activityList;
	}

	public void setActivityList(List<Activity> activityList) {
		this.activityList = activityList;
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
}