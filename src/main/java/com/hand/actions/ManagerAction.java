package com.hand.actions;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hand.entity.Scenery;
import com.hand.entity.Tab;
import com.hand.entity.User;
import com.hand.service.ISceneryService;
import com.hand.service.ITabService;
import com.hand.service.IUserService;
import com.hand.util.UploadFile;
import com.opensymphony.xwork2.ActionContext;
public class ManagerAction extends BaseAction {

private static Integer numPage=2;
	
	// myFile属性用来封装上传的文件  
    private File imgUpLoad;  
      
    // myFileContentType属性用来封装上传文件的类型  
    private String imgUpLoadContentType;  
  
    // myFileFileName属性用来封装上传文件的文件名  
    private String imgUpLoadFileName;  
	
    
    
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

	@Resource(name = "userService")
	private IUserService userService;

	@Resource(name = "sceneryService")
	private ISceneryService sceneryService;
	
	@Resource(name = "tabService")
	private ITabService tabService;

	public String Index(){
		return "index";
	}
	
	//  退出登录
	public String DoLogOut(){
		try{
			Map session=ActionContext.getContext().getSession();
			session.remove("manager");
			return "logOutSuccess";
		}
		catch(Exception ex){
			ex.printStackTrace();
			return "logOutFailed";
		}
	}
	
	// 修改信息
	public String ModifyInfo(){

		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		//String mail="123";
		User userNew=userService.GetUser(mail);
		session.put("user", userNew);
		return "modifyInfo";
	}
	
	// 做修改信息
	public String DoModifyInfo(){
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		User userNew=userService.GetUser(mail);
		HttpServletRequest request=ServletActionContext.getRequest();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		Integer sex = Integer.parseInt(request.getParameter("sex"));
		
		userNew.setName(name);
		userNew.setPassword(password);
		userNew.setSex(sex);
		
		userService.UpdateUser(userNew);
		
		return "modifySuccess";
	}
	
	// 管理用户
	public String ManageUser() {

		String sqlSum = "select count(*) as sumkey from user";
		String sql = "select * from user";

		Integer total = userService.GetTotal(sqlSum, numPage);
		List<User> userList = userService.GetList(sql, 1, numPage, total);
		HttpServletRequest request = ServletActionContext.getRequest();

		request.setAttribute("userList", userList);
		request.setAttribute("page", 1);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);

		return "manangeUser";
	}
	
	public String ManageUserSub() {

		String sqlSum = "select count(*) as sumkey from user";
		String sql = "select * from user";

		HttpServletRequest request = ServletActionContext.getRequest();
		String pageStr = request.getParameter("page");
		Integer page = Integer.parseInt(pageStr);

		Integer total = userService.GetTotal(sqlSum, numPage);
		List<User> userList = userService.GetList(sql, page, numPage, total);

		request.setAttribute("userList", userList);
		request.setAttribute("page", page);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);

		return "manangeUserSub";
	}

	public String ModifyUserInfo() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String mail = request.getParameter("mail");

		User user = userService.GetUser(mail);
		request.setAttribute("user", user);

		return "modifyUserInfo";
	}

	public String DoModifyUserInfo() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String mail = request.getParameter("mail");
		User userNew = userService.GetUser(mail);
		
		String name = request.getParameter("name");
		Integer sex = Integer.parseInt(request.getParameter("sex"));

		userNew.setName(name);
		userNew.setSex(sex);

		userService.UpdateUser(userNew);
		
		return "modifySuccess";
	}
	
	public void AddUser(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String mail = request.getParameter("mail");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			Integer identity = Integer.parseInt(request.getParameter("identity"));
			Integer sex = Integer.parseInt(request.getParameter("sex"));

			User user = new User();
			user.setMail(mail);
			user.setName(name);
			user.setPassword(password);
			user.setIdentity(identity);
			user.setSex(sex);
			user.setIsUsed(1);
			HttpServletResponse response=ServletActionContext.getResponse();
			PrintWriter out = response.getWriter();
			
			try{
			userService.AddUser(user);
			out.print("1");
			}
			catch(Exception ex){
				ex.printStackTrace();
				out.print("0");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void DisableUser(){
		try{
		HttpServletRequest request=ServletActionContext.getRequest();
		String mail=request.getParameter("mail");
		
		User user=userService.GetUser(mail);
		user.setIsUsed(0);
		userService.UpdateUser(user);
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void AbleUser(){
		try{
		HttpServletRequest request=ServletActionContext.getRequest();
		String mail=request.getParameter("mail");
		
		User user=userService.GetUser(mail);
		user.setIsUsed(1);
		userService.UpdateUser(user);
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void InitializeUserPassword(){
		try{
		HttpServletRequest request=ServletActionContext.getRequest();
		String mail=request.getParameter("mail");
		
		User user=userService.GetUser(mail);
		
		user.setPassword(user.getMail());;
		userService.UpdateUser(user);
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public String DetailUserInfo(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String mail=request.getParameter("mail");
		User user=userService.GetUser(mail);
		request.setAttribute("user",user);
		
		return "detailSceneryInfo";
	}
	
public String ManageScenery(){
		String sqlSum="select count(*) as sumkey from scenery order by createdate";
		String sql="select * from scenery order by createdate";
		
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, 1, numPage, total);
		HttpServletRequest request=ServletActionContext.getRequest();
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", 1);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "manageScenery";
	}
	
	public String ManageScenerySub(){
		
		String sqlSum="select count(*) as sumkey from scenery  order by createdate";
		String sql="select * from scenery  order by createdate";
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String pageStr=request.getParameter("page");
		Integer page=Integer.parseInt(pageStr);
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, page, numPage, total);
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", page);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "manageScenerySub";
	}
	
	public String ModifyScenery(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "modifyScenery";
	}
	
	public String DoModifyScenery(){
		try{
			HttpServletRequest request=ServletActionContext.getRequest();
			String sceneryId=request.getParameter("sceneryId");
			String summary=request.getParameter("summary");
			String richText=request.getParameter("richText");
			String detailSub=request.getParameter("detailSub");
			
			Scenery sceneryOld=sceneryService.GetScenery(sceneryId);
			if(!sceneryOld.getDetail().equals(richText))sceneryOld.setDetail(richText);
			if(!sceneryOld.getSummary().equals(summary)){
				sceneryOld.setSummary(summary);
				sceneryOld.setDetailSub(detailSub);
			}
			
			if(imgUpLoad!=null){
				String picAddr=UploadFile.SaveFile(imgUpLoad, this.getImgUpLoadFileName());
	        sceneryOld.setPicaddr("/jsp/img/"+picAddr);
			}
	       
			sceneryService.UpdateScenery(sceneryOld);
			
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			
			return "modifyScenerySuccess";
	}
	
	public String AddScenery(){
		try{
			
		HttpServletRequest request=ServletActionContext.getRequest();
		String summary=request.getParameter("summary");
		String richText=request.getParameter("richText");
		String mail=request.getParameter("userId");
		String detailSub=request.getParameter("detailSub");
		
		String picAddr=UploadFile.SaveFile(imgUpLoad, this.getImgUpLoadFileName());
		
        String s=UUID.randomUUID().toString();
		String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
		
		User user=userService.GetUser(mail);
		
		Scenery scenery=new Scenery();
		scenery.setDetail(richText);
		scenery.setId(id);
		scenery.setPicaddr("/jsp/img/"+picAddr);
		scenery.setSummary(summary);
		scenery.setUser_id(user);
		scenery.setCreateDate(new Date());
		scenery.setDetailSub(detailSub);
	
		sceneryService.AddScenery(scenery);
		
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		return "addScenerySuccess";
	}
	public String DetailSceneryInfo(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery",scenery);
		
		return "detailSceneryInfo";
	}
	
	public void getSexData(){
		try{
		Integer manSum=userService.getManSum();
		Integer womenSum=userService.getWomenSum();
		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
        
        Map<String, Object> paramMap=new HashMap<String,Object>();
        paramMap.put("man",manSum);
        paramMap.put("women",womenSum);
        
        out.print(gson.toJson(paramMap));
	   }
	   catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void getIdentityData(){
		try{
		Integer userSum=userService.getUserSum();
		Integer expertSum=userService.getExpertSum();
		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
        
        Map<String, Object> paramMap=new HashMap<String,Object>();
        paramMap.put("user",userSum);
        paramMap.put("expert",expertSum);
        
        out.print(gson.toJson(paramMap));
	   }
	   catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void getTabList(){
		System.err.println("----->> getTabList");
		try{
			List<Tab> tabList=tabService.getAll();
			response.setContentType("text/json"); 
	        response.setCharacterEncoding("UTF-8"); 
	        PrintWriter out = response.getWriter();
	        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
	        
	        Map<String, Object> paramMap=new HashMap<String,Object>();
	        paramMap.put("tabList", tabList);
			System.err.println(gson.toJson(paramMap).toString());
	        out.print(gson.toJson(paramMap));
		   }
		   catch(Exception ex){
				ex.printStackTrace();
			}
	}
	public void AddTab(){
		try {

			String name=request.getParameter("name");
			String position=request.getParameter("position");
			
			Tab tab=new Tab();
			tab.setIsUsed(1);
			tab.setName(name);
			tab.setPosition(Integer.parseInt(position));
			tabService.addTab(tab);
			
			PrintWriter out = response.getWriter();
			out.print("1");
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void DisableTab(){
		try{
			String id=request.getParameter("id");
			
			Tab tab=tabService.getTab(Integer.parseInt(id));
			tab.setIsUsed(0);
			tabService.updateTab(tab);
			
			PrintWriter out = response.getWriter();
			out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void AbleTab(){
		try{
			String id=request.getParameter("id");
			
			Tab tab=tabService.getTab(Integer.parseInt(id));
			tab.setIsUsed(1);
			tabService.updateTab(tab);
			
			PrintWriter out = response.getWriter();
			out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public String ModifyTabInfo(){
		
		String id=request.getParameter("id");
		
		Tab tab=tabService.getTab(Integer.parseInt(id));
		request.setAttribute("tab", tab);
		
		return "modifyTabInfo";
	}
	
	public String DoModifyTabInfo() {
		
		Integer id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		Integer position=Integer.parseInt(request.getParameter("position"));
		
		Tab tab=tabService.getTab(id);
		String nameOld=tab.getName();
		Integer positionOld=tab.getPosition();
		if(!nameOld.equals(name))tab.setName(name);
		if(!position.equals(positionOld))tab.setPosition(position);
		tabService.updateTab(tab);
		
		return "modifyTabSuccess";
	}
	
	public String ManageTab(){
		return "manageTab";
	}
public void getUserList() throws Exception{
	
		String sqlSum = "select count(*) as sumkey from user where identity=1";
		String sql = "select * from user where identity=1";
			
		Integer page=Integer.parseInt(request.getParameter("page"));
		Integer total=userService.GetTotal(sqlSum, numPage);
		List<User> userList=userService.GetList(sql, page, numPage, total);
		
		
		response.setContentType("text/json"); 
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").excludeFieldsWithoutExposeAnnotation().create();
        
        Map<String, Object> paramMap=new HashMap<String,Object>();
        paramMap.put("page",page);
        paramMap.put("total",total);
        paramMap.put("numPage",numPage);
        paramMap.put("userList",userList);
		
        out.print(gson.toJson(paramMap));
	}
	
}
