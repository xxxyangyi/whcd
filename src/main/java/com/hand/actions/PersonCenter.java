package com.hand.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.hand.entity.Scenery;
import com.hand.entity.User;
import com.hand.service.ISceneryService;
import com.hand.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PersonCenter extends ActionSupport {
	
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
	
	public String CreateScenery(){
		return "createScenery";
	}
	
	public String DoCreateScenery(){
		try{
		HttpServletRequest request=ServletActionContext.getRequest();
		String summary=request.getParameter("summary");
		String richText=request.getParameter("richText");
		
		//基于myFile创建一个文件输入流  
        InputStream is = new FileInputStream(imgUpLoad);  
          
        // 设置上传文件目录  
        String uploadPath = ServletActionContext.getServletContext().getRealPath("/jsp/img");  
          
        // 设置目标文件  
        File toFile = new File(uploadPath, this.getImgUpLoadFileName());  
          
        // 创建一个输出流  
        OutputStream os = new FileOutputStream(toFile);  
  
        //设置缓存  
        byte[] buffer = new byte[1024];  
  
        int length = 0;  
  
        //读取myFile文件输出到toFile文件中  
        while ((length = is.read(buffer)) > 0) {  
            os.write(buffer, 0, length);  
        }
        //private  String strPicPerson=(this.getClass().getClassLoader().getResource("").getPath()).replaceAll("%20"," ").replace("/WEB-INF/classes/", "/jsp/img/"); 
        System.out.println("上传文件名"+uploadPath); 
        System.out.println("上传文件名"+imgUpLoadContentType);  
        System.out.println("上传文件类型"+imgUpLoadFileName);  
        //关闭输入流  
        is.close();  
        //关闭输出流  
        os.close();  
        
        String s=UUID.randomUUID().toString();
		String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		
		Scenery scenery=new Scenery();
		scenery.setDetail(richText);
		scenery.setId(id);
		scenery.setPicaddr("/jsp/img/"+this.getImgUpLoadFileName());
		scenery.setSummary(summary);
		scenery.setUser_id(user);
		scenery.setCreateDate(new Date());
		
		sceneryService.AddScenery(scenery);
		
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		return "createScenerySuccess";
	}
	
	public String SceneryManage(){
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		
		String sqlSum="select count(*) as sumkey from scenery where user_id='"+mail+"' order by createdate";
		String sql="select * from scenery where user_id='"+mail+"' order by createdate";
		//String sqlSum="select count(*) as sumkey from scenery where user_id='"+123+"' order by createdate";
		//String sql="select * from scenery where user_id='"+123+"' order by createdate";
		
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, 1, numPage, total);
		HttpServletRequest request=ServletActionContext.getRequest();
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", 1);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "sceneryManage";
	}
	
	public String SceneryManageSub(){
		
		Map session=ActionContext.getContext().getSession();
		User user=(User) session.get("user");
		String mail=user.getMail();
		
		String sqlSum="select count(*) as sumkey from scenery where user_id='"+mail+"' order by createdate";
		String sql="select * from scenery where user_id='"+mail+"' order by createdate";
		
//		String sqlSum="select count(*) as sumkey from scenery where user_id='"+123+"' order by createdate";
//		String sql="select * from scenery where user_id='"+123+"' order by createdate";
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String pageStr=request.getParameter("page");
		Integer page=Integer.parseInt(pageStr);
		
		Integer total=sceneryService.GetTotal(sqlSum, numPage);
		List<Scenery> sceneryList=sceneryService.GetList(sql, page, numPage, total);
		
		request.setAttribute("sceneryList", sceneryList);
		request.setAttribute("page", page);
		request.setAttribute("total", total);
		request.setAttribute("numPage", numPage);
		
		return "sceneryManageSub";
	}
	
	public String SceneryDetail(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "sceneryDetail";
	}
	
	public String SceneryModify(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		request.setAttribute("scenery", scenery);
		
		return "sceneryModify";
	}
	
	public String DoSceneryModify(){
		try{
			HttpServletRequest request=ServletActionContext.getRequest();
			String sceneryId=request.getParameter("sceneryId");
			String summary=request.getParameter("summary");
			String richText=request.getParameter("richText");
			
			Scenery sceneryOld=sceneryService.GetScenery(sceneryId);
			if(!sceneryOld.getDetail().equals(richText))sceneryOld.setDetail(richText);
			if(!sceneryOld.getSummary().equals(summary))sceneryOld.setSummary(summary);
			
			if(imgUpLoad!=null){
			//基于myFile创建一个文件输入流  
	        InputStream is = new FileInputStream(imgUpLoad);  
	          
	        // 设置上传文件目录  
	        String uploadPath = ServletActionContext.getServletContext().getRealPath("/jsp/img");  
	          
	        // 设置目标文件  
	        File toFile = new File(uploadPath, this.getImgUpLoadFileName());  
	          
	        // 创建一个输出流  
	        OutputStream os = new FileOutputStream(toFile);  
	  
	        //设置缓存  
	        byte[] buffer = new byte[1024];  
	  
	        int length = 0;  
	  
	        //读取myFile文件输出到toFile文件中  
	        while ((length = is.read(buffer)) > 0) {  
	            os.write(buffer, 0, length);  
	        }
	        //private  String strPicPerson=(this.getClass().getClassLoader().getResource("").getPath()).replaceAll("%20"," ").replace("/WEB-INF/classes/", "/jsp/img/"); 
	        System.out.println("上传文件名"+uploadPath); 
	        System.out.println("上传文件名"+imgUpLoadContentType);  
	        System.out.println("上传文件类型"+imgUpLoadFileName);  
	        //关闭输入流  
	        is.close();  
	        //关闭输出流  
	        os.close();  
	        sceneryOld.setPicaddr("/jsp/img/"+this.getImgUpLoadFileName());
			}
	       
			sceneryService.UpdateScenery(sceneryOld);
			
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
			
			return "modifyScenerySuccess";
	}
	public void DeleteScenery(){
		
		try{
		HttpServletRequest request=ServletActionContext.getRequest();
		String sceneryId=request.getParameter("sceneryId");
		
		Scenery scenery=sceneryService.GetScenery(sceneryId);
		sceneryService.DeleteScenery(scenery);
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		out.print("1");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	
	
}