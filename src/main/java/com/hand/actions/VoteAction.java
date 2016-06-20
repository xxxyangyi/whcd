package com.hand.actions;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
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
import com.hand.util.UploadFile;
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
	private List<Vote> voteList; 
	private Activity activity;
    private File imgUpLoad;
    private String imgUpLoadContentType;  
    private String imgUpLoadFileName;
	private int flag;
    
	public void Index() {
		Vote vote = new Vote();
		vote.setId(1);
		vote.setContext("成功啦");
		voteService.AddVote(vote);
	}
	
	//  添加投票信息
	public String voteAdd(){
		System.out.println("====================voteAdd");
		System.out.println(vote.getId());
		int activity_id =Integer.parseInt(request.getParameter("activity_id"));
		String picAddr=UploadFile.SaveFile(imgUpLoad, this.getImgUpLoadFileName());
		System.out.println(picAddr);
		vote.setActivity_id(activityService.GetActivity(activity_id));
		vote.setUser_id((User)session.get("user"));
		vote.setUserImg(picAddr);
		voteService.AddVote(vote);
		System.out.println("====================成功了！");
		return "success";
	}
	
	// 获得通过的投票信息
	public String getActivityVotesPassed() throws IOException {
		int activity_id = Integer.parseInt(request.getParameter("activity_id"));
		activity = activityService.GetActivity(activity_id);
		String str = "";
		if(session.get("user")!=null && ((User)session.get("user")).getIdentity()==0){
			 str = "SELECT * from vote WHERE activity_id = "+activity_id;		
		}else{
			str = "SELECT * from vote WHERE activity_id = "+activity_id+" and review = 0;";
		}		 
		voteList = voteService.FindBySQL(str);
		Collections.sort(voteList, new Comparator<Vote>() {
			@Override
            public int compare(Vote v1, Vote v2) {
				double x=0;
				double y=0;
				if(activity.getExpertNum()==0){
					 x = v1.getVoteNum();
					 y = v2.getVoteNum();
				}else{
					 x = v1.getVoteNum() + 
							(v1.getExpertVoteNum()/activity.getExpertNum())*(activity.getWeight()/(1-activity.getWeight()))*activity.getUserNum();
					 y = v2.getVoteNum() + 
							(v2.getExpertVoteNum()/activity.getExpertNum())*(activity.getWeight()/(1-activity.getWeight()))*activity.getUserNum();								
				}
					//System.out.println("x:" +x +"   y:"+y);
				return (int) (y-x);
            }
        });	
		
		return "success";
	}

	// 给某人投票
	public void voteFor() throws IOException{
		System.out.println("======voteFor");
		int		 activity_id=Integer.parseInt(request.getParameter("activity_id"));
		int		 vote_id  =  Integer.parseInt(request.getParameter("vote_id"));
		String	 voteFor  =  request.getParameter("voteFor");
		String	 user_id  =  ((User)session.get("user")).getMail();
		int	 msg= 0; // 0 代表 投票成功  1 代表投票失败 2 表示已经投过票
		String str = "SELECT * FROM usertoactivity where activity_id = "+activity_id+" and user_id=\""+user_id+"\";";
		List<UserToActivity> userToActivityList =  userToActivityService.FindBySQL(str);		
		System.out.println("size ="+userToActivityList.size());
		if(userToActivityList.size() ==1){ // 参加了活动，但没有进行投票的情况（专家不会参加活动，所以专家不会有此种情况）
			System.out.println(userToActivityList.get(0).getVotefor());
			if(userToActivityList.get(0).getVotefor().equals("")){
				userToActivityList.get(0).setVotefor(voteFor);
				userToActivityService.Update(userToActivityList.get(0));
				//游客总票数加1
				activity =activityService.GetActivity(activity_id);
				System.out.println("-------");
				System.out.println(activity.getUserNum()+1);
				activity.setUserNum(activity.getUserNum()+1);
				activityService.update(activity);
				System.out.println("-------");
				//票数加1
				vote = voteService.GetVote(vote_id);
				vote.setVoteNum(vote.getVoteNum()+1);
				voteService.update(vote);
			}else{
				System.out.println(userToActivityList.get(0).getActivity_id().getId());
				System.out.println("该用户已经投过票");
				msg=2;
			}
		}
		if(userToActivityList.size() ==0){// 在这里面要明确的区分 游客和专家的投票
			System.out.println("开始添加");
			UserToActivity userToActivity = new UserToActivity();
			userToActivity.setUser_id(((User)session.get("user")));
			userToActivity.setActivity_id((Activity)activityService.GetActivity(activity_id));
			userToActivity.setVotefor(voteFor);
			userToActivityService.Merge(userToActivity);
			System.out.println("1开始添加");
			if(((User)session.get("user")).getIdentity()==2){ // 当是专家的时候
				System.out.println("2开始添加");
				//专家总人数加1
				activity =activityService.GetActivity(activity_id);
				activity.setExpertNum(activity.getExpertNum()+1);
				activityService.update(activity);
				//专家投票数加1 
				vote = voteService.GetVote(vote_id);
				vote.setExpertVoteNum(vote.getExpertVoteNum()+1);
				voteService.update(vote);
				System.out.println("3开始添加");
				
			}else{
				System.out.println("4开始添加");
				//游客总票数加1
				activity =activityService.GetActivity(activity_id);
				activity.setUserNum(activity.getUserNum()+1);
				activityService.update(activity);
				//票数加1
				vote = voteService.GetVote(vote_id);
				vote.setVoteNum(vote.getVoteNum()+1);
				voteService.update(vote);
				System.out.println("5开始添加");
			}
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
	
	// 管理员获取活动Form的信息
	public String manageActivityForm() throws IOException {
		System.out.println("manageActivityForm");
		int activity_id = Integer.parseInt(request.getParameter("activity_id"));
		activity = 	activityService.GetActivity(activity_id);
		String str = "";
		str = "SELECT * from vote WHERE activity_id = "+activity_id+" and review = 1;";
		voteList = voteService.FindBySQL(str);
		Collections.sort(voteList, new Comparator<Vote>() {
			@Override
            public int compare(Vote v1, Vote v2) {
				double x=0;
				double y=0;
				if(activity.getExpertNum()==0){
					 x = v1.getVoteNum();
					 y = v2.getVoteNum();
				}else{
					 x = v1.getVoteNum() + 
							(v1.getExpertVoteNum()/activity.getExpertNum())*(activity.getWeight()/(1-activity.getWeight()))*activity.getUserNum();
					 y = v2.getVoteNum() + 
							(v2.getExpertVoteNum()/activity.getExpertNum())*(activity.getWeight()/(1-activity.getWeight()))*activity.getUserNum();								
				}
					//System.out.println("x:" +x +"   y:"+y);
				return (int) (y-x);
            }
        });		
		return "success";
	}
	
	// 管理员 获取审核参加活动的信息
	public String managerVoteInfoReview() throws IOException {
		System.out.println("managerVoteInfoReview");
		// flag 1 代表未审核 2 代表审核未通过的
		int pageflag = Integer.parseInt(request.getParameter("pageflag"));
		String str = "";
		if(pageflag ==1){
			str = "SELECT * from vote WHERE review = 0;";
			flag= 1;
		}else{
			str = "SELECT * from vote WHERE review = 2;";
			flag= 2;
		}	
		voteList = voteService.FindBySQL(str);	
		return "success";
	}
	
	// 管理员 进行审核 通过或不通过
	public void managerVoteInfoReviewPassORNotPass() throws IOException {
		System.out.println("managerVoteInfoReview");
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
		PrintWriter out = response.getWriter();
		int vote_id = Integer.parseInt(request.getParameter("vote_id"));
		int review = Integer.parseInt(request.getParameter("review"));
		vote = voteService.GetVote(vote_id);
		vote.setReview(review);
		voteService.update(vote);
		out.print("修改成功");
	}
	
	/////////////////get set 方法 //////////////////////////////////////////////////////////////
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public List<Vote> getVoteList() {
		return voteList;
	}
	public void setVoteList(List<Vote> voteList) {
		this.voteList = voteList;
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
	public File getImgUpLoad() {
		return imgUpLoad;
	}
	public void setImgUpLoad(File imgUpLoad) {
		this.imgUpLoad = imgUpLoad;
	}
	public String getImgUpLoadContentType() {
		return imgUpLoadContentType;
	}
	public void setImgUpLoadContentType(String imgUpLoadContentType) {
		this.imgUpLoadContentType = imgUpLoadContentType;
	}
	public String getImgUpLoadFileName() {
		return imgUpLoadFileName;
	}
	public void setImgUpLoadFileName(String imgUpLoadFileName) {
		this.imgUpLoadFileName = imgUpLoadFileName;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}