package com.hand.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.hand.entity.Activity;
import com.hand.entity.User;
import com.hand.entity.UserToActivity;
import com.hand.entity.Vote;
import com.hand.service.IActivityService;
import com.hand.service.IUserService;
import com.hand.service.IUserToActivityService;
import com.hand.service.IVoteService;
import com.opensymphony.xwork2.ActionSupport;

public class VoteAction extends ActionSupport implements SessionAware,ServletRequestAware,ServletResponseAware{
	
	@Resource(name = "voteService")
	private IVoteService voteService;
	@Resource(name = "activityService")
	private IActivityService activityService;
	@Resource(name = "userToActivityService")
	private IUserToActivityService userToActivityService;
	@Resource(name = "userService")
	private IUserService userService;
	private Map session;
	private HttpServletRequest  request;
	private HttpServletResponse response;
	private Vote vote;
	
	
	public void Index() {
		Vote vote = new Vote();
		vote.setId(1);
		vote.setContext("成功啦");
		voteService.AddVote(vote);
	}
	
	//  添加投票信息
	public String voteAdd(){
		System.out.println("====================voteAdd");
		int activity_id =Integer.parseInt(request.getParameter("activity_id"));
		vote.setActivity_id(activityService.GetActivity(activity_id));
		vote.setUser_id((User)session.get("user"));
		voteService.AddVote(vote);
		System.out.println("====================成功了！");
		return "success";
	}

	// 给某人投票
	public void voteFor() throws IOException{
		System.out.println("======voteFor");
		int		 activity_id	=Integer.parseInt(request.getParameter("activity_id"));
		int		 vote_id  =  Integer.parseInt(request.getParameter("vote_id"));
		String	 voteFor  = 	request.getParameter("voteFor");
		String	 user_id 		=((User)session.get("user")).getMail();
		int	 msg= 0; // 0 代表 投票成功  1 代表投票失败 2 表示已经投过票
		String str = "SELECT * FROM usertoactivity where activity_id = "+activity_id+" and user_id=\""+user_id+"\";";
		List<UserToActivity> userToActivityList =  userToActivityService.FindBySQL(str);		
		System.out.println("size ="+userToActivityList.size());
		if(userToActivityList.size() ==1){
			System.out.println(userToActivityList.get(0).getVotefor());
			if(userToActivityList.get(0).getVotefor().equals("")){
				userToActivityList.get(0).setVotefor(voteFor);
				userToActivityService.Update(userToActivityList.get(0));
				//票数加1
				vote = voteService.GetVote(vote_id);
				vote.setVoteNum(vote.getVoteNum()+1);
				voteService.update(vote);
			}else{
				System.out.println("该用户已经投过票");
				msg=2;
			}
		}
		if(userToActivityList.size() ==0){
			System.out.println("开始添加");
			UserToActivity userToActivity = new UserToActivity();
			userToActivity.setUser_id(((User)session.get("user")));
			userToActivity.setActivity_id((Activity)activityService.GetActivity(activity_id));
			userToActivity.setVotefor(voteFor);
			userToActivityService.AddUserToActivity(userToActivity);
			//票数加1
			vote = voteService.GetVote(vote_id);
			vote.setVoteNum(vote.getVoteNum()+1);
			voteService.update(vote);
			System.out.println("添加结束");
		}		
		if(userToActivityList.size() !=0 && userToActivityList.size() !=1){
			msg =1;
		}		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(msg);
		
	}

	
	/////////////////get set 方法 //////////////////////////////////////////////////////////////
	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
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