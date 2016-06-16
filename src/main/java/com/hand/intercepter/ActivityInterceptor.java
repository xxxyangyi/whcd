package com.hand.intercepter;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.hand.entity.Activity;
import com.hand.entity.User;
import com.hand.entity.Vote;
import com.hand.service.IActivityService;
import com.hand.service.IVoteService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ActivityInterceptor extends AbstractInterceptor{
	@Resource(name = "voteService")
	private IVoteService voteService;
	@Resource(name = "activityService")
	private IActivityService activityService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("对于活动的拦截");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		Map session = invocation.getInvocationContext().getSession();
		Map<String, Object> parameters = invocation.getInvocationContext().getParameters();
		User user =(User)session.get("user");
		if(user ==null){
			out.println("请您先登陆");
			return null;
		}
		System.out.println(user.getMail());
		String[] activity = (String[]) parameters.get("activity_id");
		System.out.println(activity[0]);
		
		// 先判断时间是否符合条件，再判断是否是第二次参加投票
		String str ="SELECT * FROM vote where activity_id = "+activity[0]+" and user_id=\""+user.getMail()+"\";";
		List<Vote> list = voteService.FindBySQL(str);
		System.out.println(list.size());
		String str2 ="SELECT * FROM activity where id = "+activity[0]+";";
		List<Activity> list2 = activityService.FindBySQL(str2);
		System.out.println(((Activity)list2.get(0)).getCreateTime());
		// 如果时间不符合条件，或者已经参加过投票，则返回错误信息

		Date now = new Date();
		if(((Activity)list2.get(0)).getStartTime().after(now)){
			out.println("活动还没有开始");
			return null;
		}
		if(((Activity)list2.get(0)).getEndTime().before(now)){
			out.println("活动已经结束");
			return null;
		}
		if(list.size()!=0){
			out.println("您已经参加过此活动");
			return null;
		}
		return invocation.invoke(); 
	}
}
