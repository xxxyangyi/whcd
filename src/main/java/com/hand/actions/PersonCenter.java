package com.hand.actions;

import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;

import com.hand.entity.Scenery;
import com.hand.entity.Tab;
import com.hand.entity.User;
import com.hand.service.ISceneryService;
import com.hand.service.ITabService;
import com.hand.service.IUserService;
import com.hand.util.UploadFile;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PersonCenter extends BaseAction {
	
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
	
	public String ModifyInfo(){
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		//String mail="123";
		User userNew=userService.GetUser(mail);
		session.put("user", userNew);
		return "modifyInfo";
	}
	public String DoModifyInfo(){
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		User userNew=userService.GetUser(mail);
		request=ServletActionContext.getRequest();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		Integer sex = Integer.parseInt(request.getParameter("sex"));
		
		userNew.setName(name);
		userNew.setPassword(password);
		userNew.setSex(sex);
		
		userService.UpdateUser(userNew);
		
		return "modifySuccess";
	}
	
	public String CreateScenery(){
		return "createScenery";
	}
	
	public String DoCreateScenery(){
		try{
		request=ServletActionContext.getRequest();
		String summary=request.getParameter("summary");
		String richText=request.getParameter("richText");
		String detailSub=request.getParameter("detailSub");
		Integer tabId=Integer.parseInt(request.getParameter("tab"));
		
		String picAddr=UploadFile.SaveFile(imgUpLoad, this.getImgUpLoadFileName());
        
		
        String s=UUID.randomUUID().toString();
		String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		
		Scenery scenery=new Scenery();
		scenery.setDetail(richText);
		scenery.setId(id);
		scenery.setPicaddr("/jsp/img/"+picAddr);
		scenery.setSummary(summary);
		scenery.setUser_id(user);
		scenery.setCreateDate(new Date());
		scenery.setDetailSub(detailSub);
		Tab tab=tabService.getTab(tabId);
		scenery.setTab_id(tab);
		scenery.setIsAudited(0);
		
		sceneryService.AddScenery(scenery);
		
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		return "createScenerySuccess";
	}
	
//	public String DoSceneryModify(){
//		try{
//			HttpServletRequest request=ServletActionContext.getRequest();
//			String sceneryId=request.getParameter("sceneryId");
//			String summary=request.getParameter("summary");
//			String richText=request.getParameter("richText");
//			String detailSub=request.getParameter("detailSub");
//			Integer tabid=Integer.parseInt(request.getParameter("tab"));
//
//			Scenery sceneryOld=sceneryService.GetScenery(sceneryId);
//			Tab tabNew=tabService.getTab(tabid);
//			Tab tabOld=sceneryOld.getTab_id();
//			if(tabOld.getId()!=tabNew.getId())sceneryOld.setTab_id(tabNew);
//			if(!sceneryOld.getDetail().equals(richText))sceneryOld.setDetail(richText);
//			if(!sceneryOld.getSummary().equals(summary))sceneryOld.setSummary(summary);
//			if(!sceneryOld.getDetailSub().equals(detailSub))sceneryOld.setDetailSub(detailSub);
//
//
//			if(imgUpLoad!=null){
//			String picAddr=UploadFile.SaveFile(imgUpLoad, this.getImgUpLoadFileName());
//	        sceneryOld.setPicaddr("/jsp/img/"+picAddr);
//			}
//
//			sceneryService.UpdateScenery(sceneryOld);
//
//			}
//			catch(Exception ex){
//				ex.printStackTrace();
//			}
//
//			return "modifyScenerySuccess";
//	}

}
