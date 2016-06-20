window.onload=function() {
	//通过判断 activity_list 标签是否存在 ，判断是否要请求加载 活动清单数据
	if ($("#activity_list").length > 0) {
		console.log("activity_list 存在：请求数据");
		$.ajax({
			type : "post",
			data : {},
			url : "http://localhost:8080/WHCD/activity/getActivitys",
			async : false,
			dataType : 'json',
			success : function(msg) {
				if (msg) {
					console.log("请求数据成功： "+ msg.length);
					var i = 0;
					for (i; i < msg.length; i++) {
						if (i%2 == 0) {
							$("#activity_list").append(
																	"<div class='col-lg-10 col-lg-offset-1'>"
																			+ "<div class='panel panel-default'>"
																			+ "<div class='panel-body'>"
																			+ "<div class='media'>"
																			+ "<div class='media-left media-middle'>"
																			+ "<img class='media-object ' height='100px'"
																			+ "width='100px' src='jsp/image/sky.jpg' alt='...'>"
																			+ "</div>"
																			+ "<div class='media-body'>"
																			+ "<h4 class='media-heading'>"
																			+ "<a href='http://localhost:8080/WHCD/activity/getActivityVotesPassed?activity_id="+msg[i].id+"'> "
																			+ msg[i].activityName
																			+ "</a>"
																			+ "</h4>"
																			+ msg[i].context
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>")
												} else {
													$("#activity_list")
															.append(
																	"<div class='col-lg-10 col-lg-offset-2'>"
																			+ "<div class='panel panel-default'>"
																			+ "<div class='panel-body'>"
																			+ "<div class='media'>"
																			+ "<div class='media-body'>"
																			+ "<a href='http://localhost:8080/WHCD/activity/getActivityVotesPassed?activity_id="+msg[i].id+"'> "
																			+ "<h4 class='media-heading'>"+msg[i].activityName+"</h4>"
																			+ "</a>"
																			+ msg[i].context																			+ "</div>"
																			+ "<div class='media-right media-middle'>"
																			+ " <img class='media-object ' height='100px'"
																			+ "width='100px' src='jsp/image/sky.jpg' alt='...'>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>")
												}
											}				
				} else {
					console.log("请求数据失败： "+ msg);
				}
			}
		})	
		} else {
			console.log("activity_list 不存在：不请求数据");
		}
		
	// 首页加载活动
	if ($("#home_activity_list").length > 0) {
		console.log("home_activity_list 存在：请求数据");
		$.ajax({
			type : "post",
			data : {},
			url : "http://localhost:8080/WHCD/activity/getActivitys",
			async : true,
			dataType : 'json',
			success : function(msg) {
				if (msg) {
					console.log("请求数据成功： "+ msg.length);
					var i = 0;
					var y = 0;
					if(msg.length<=6){
						y=msg.length;
					}else{
						y=6;
					}
					console.log(y)
					for (i; i < y; i++) {
						console.log(i)
							$("#home_activity_list").append(
																	"<div class='panel panel-default'>"+
																	"<div class='panel-body'>"
																			+ "<div class='media'>"
																			+ "<div class='media-left media-middle'>"
																			+"<img class='media-object' height='50px' width='50px' src='jsp/image/sky.jpg'>"
																			+ "</div>"
																			+ "<div class='media-body'>"
																			+ "<h4 class='media-heading'>"
																			+ "<a href='http://localhost:8080/WHCD/activity/getActivityVotes?activity_id="+msg[i].id+"'> "
																			+msg[i].activityName
																			+"</a>"
																			+"</h4>"
																			+ msg[i].context
																			+ "</div>"
																			+ "</div>"
																			+ "</div>	"	
																			+"</div>"
							
							
							)
					}				
				} else {
					console.log("请求数据失败： "+ msg);
				}
			}
		})	
		} else {
			console.log("home_activity_list 不存在：不请求数据");
		}
	
	if ($("#home_scenery_list").length > 0) {
		console.log("home_scenery_list 存在：请求数据");
		$.ajax({
			type : "post",
			data : {},
			url : "http://localhost:8080/WHCD/Scenery/SceneryListGson",
			async : true,
			dataType : 'json',
			success : function(msg) {
				if (msg) {
					console.log("请求数据成功： "+ msg.length);
					var i = 0;
					var y = 0;
					if(msg.length<=6){
						y=msg.length;
					}else{
						y=6;
					}
					console.log(y)
					for (i; i < y; i++) {
						console.log(i)
							$("#home_scenery_list").append("1"
														
							)
					}				
				} else {
					console.log("请求数据失败： "+ msg);
				}
			}
		})	
		} else {
			console.log("home_activity_list 不存在：不请求数据");
		}
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	$(".list-group a").each(function() {
		$(this).removeClass("active");
	});
	$(".list-group a").eq(1).addClass("active");
	
	// ///////////////////////////////////////////////////////////////////////////////////////////
	$('.Time').datetimepicker({
		 format: 'DD/MM/YYYY'
	});
}
	//  点击投票事件
	function vote(activity_id,voteFor,vote_id) {
		console.log(activity_id+'=='+voteFor)
		$.ajax({
			type : "post",
			data : {activity_id:activity_id,voteFor:voteFor,vote_id:vote_id},
			url : "http://localhost:8080/WHCD/activity/voteFor",
			async : true,
			dataType : 'json',
			success : function(msg) {alert(msg)}
				
		})		
	};
	
					
	function RegText(id){
		var description=$(""+id).html();
		description = description.replace(/(\n)/g, "");  
		description = description.replace(/(\t)/g, "");  
		description = description.replace(/(\r)/g, "");  
		description = description.replace(/<\/?[^>]*>|(&nbsp;)|(amp;)/g, "");  
		description = description.replace(/\s*/g, "");  
		return description;
	}

	 function SpiltStr(str){
			var strNew="";
			if(str.length<101)return str;
			
			var i=99;
			for(;str.charCodeAt(i)>255;i++);
			
			return str.substring(0,i);	
	 }				
	 function AutoResizeImage(maxWidth,maxHeight,objImg){
		 var img = new Image();
		 img.src = objImg.src;
		 var hRatio;
		 var wRatio;
		 var Ratio = 1;
		 var w = img.width;
		 var h = img.height;
		 wRatio = maxWidth / w;
		 hRatio = maxHeight / h;
		 if (maxWidth ==0 && maxHeight==0){
		 Ratio = 1;
		 }else if (maxWidth==0){//
		 if (hRatio<1) Ratio = hRatio;
		 }else if (maxHeight==0){
		 if (wRatio<1) Ratio = wRatio;
		 }else if (wRatio<1 || hRatio<1){
		 Ratio = (wRatio<=hRatio?wRatio:hRatio);
		 }
		 if (Ratio<1){
		 w = w * Ratio;
		 h = h * Ratio;
		 }
		 objImg.height = h;
		 objImg.width = w;
	}					
		
	 function login(url) {
			var mail=$("#mailLogin").val();
			var password=$("#passwordLogin").val();
			$.ajax({
				url : url,
				async : false,
				data:{"mail":mail,"password":password},
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status==='0'||status===''){
						$("#error").html("邮箱或密码输入有误！")
					}
					else if(status==='-1'){
						$("#error").html("该用户已经被禁用！");
					}
					else{
						 location.href=status+''; 
					}
						
				}
			});
		}
		function logout(url){
			
			$.ajax({
				url : url,
				async : false,
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status==='1'){
						alert("退出成功!");
						window.location.reload();
					}
					else{
						alert("退出失败!");
					}
						
				}
			});
		}
		
		//分页设置
		
		 currentNum=1;
		
		function PrePage(){
			var num=$("#selectPage").val();
			currentNum=--num>0?num:1;
		}
		
		function NextPage(total){	
			var num=$("#selectPage").val();
			currentNum=++num<=total?num:total;
		}
		
	 	function SelectedPage() {	
			 currentNum = $("#selectPage").val();
		}
	 	
	 	//不同分页获取数据
	 function GetSceneryListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					for (var i=0; i <len&&i<numPage; i++) {
					if(i%2==0){
					 tmpStr="<div class='col-lg-10 col-lg-offset-2'>"
						+"<div class='panel panel-default'>"
						+"<div class='panel-body' style='height: 125px;'>"
						+"<div class='media'>"
						+"<div class='media-body'>"
						+"<h4 class='media-heading'>"
						+"<a href='/WHCD/Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>" 
						+arr[i].summary
						+"</a>"
						+"</h4>"
						+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
						+arr[i].detailSub
						+"</p>"
						+"</div>"
						+"<div class='media-right media-middle'>"
						+"<a> <img class='media-object' style='margin-top: 20px;'  src='/WHCD"+arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\"/WHCD/jsp/img/errorimg.jpg\"' /></a>"
						+"</div></div></div></div></div>";
						}
					else{
							tmpStr="<div class='row'>"
										+"<div class='col-lg-10 col-lg-offset-1'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-body' style='height: 125px;'>"
										+"<div class='media'>"
										+"<div class='media-left media-middle'>"
										+"<a> <img class='media-object' style='margin-top: 20px;'  src='/WHCD"+arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\"/WHCD/jsp/img/errorimg.jpg\"' /></a>"
										+"</div>"
										+"<div class='media-body'>"
										+"<h4 class='media-heading'>"
										+"<a href='/WHCD/Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
										+arr[i].summary
										+"</a>"
										+"</h4>"
										+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
										+arr[i].detailSub
										+"</p>"
										+"</div>"
										+"</div></div></div></div></div>";
						}
						htmlStr+=tmpStr;
					}
					
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetSceneryList()'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetSceneryList()' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					htmlStr+=select;
					$("#usrPanelContent").html(htmlStr);
				}
			});
	 		}
	 	}
	 	
		function GetSceneryList(){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					for (var i=0; i <len&&i<numPage; i++) {
					if(i%2==0){
					 tmpStr="<div class='col-lg-10 col-lg-offset-2'>"
						+"<div class='panel panel-default'>"
						+"<div class='panel-body' style='height: 125px;'>"
						+"<div class='media'>"
						+"<div class='media-body'>"
						+"<h4 class='media-heading'>"
						+"<a href='/WHCD/Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>" 
						+arr[i].summary
						+"</a>"
						+"</h4>"
						+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
						+arr[i].detailSub
						+"</p>"
						+"</div>"
						+"<div class='media-right media-middle'>"
						+"<a> <img class='media-object' style='margin-top: 20px;'  src='/WHCD"+arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\"/WHCD/jsp/img/errorimg.jpg\"' /></a>"
						+"</div></div></div></div></div>";
						}
					else{
							tmpStr="<div class='row'>"
										+"<div class='col-lg-10 col-lg-offset-1'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-body' style='height: 125px;'>"
										+"<div class='media'>"
										+"<div class='media-left media-middle'>"
										+"<a> <img class='media-object' style='margin-top: 20px;'  src='/WHCD"+arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\"/WHCD/jsp/img/errorimg.jpg\"' /></a>"
										+"</div>"
										+"<div class='media-body'>"
										+"<h4 class='media-heading'>"
										+"<a href='/WHCD/Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
										+arr[i].summary
										+"</a>"
										+"</h4>"
										+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
										+arr[i].detailSub
										+"</p>"
										+"</div>"
										+"</div></div></div></div></div>";
						}
						htmlStr+=tmpStr;
					}
					
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetSceneryList()'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetSceneryList()' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					htmlStr+=select;
					$("#usrPanelContent").html(htmlStr);
				}
			});
		}
		
		//个人中心获取名胜古迹列表
		function GetPersonCenterSceneryListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1,"userParam":"userParam"},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					$("#usrPanelContent table").append(select);
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'></a>"+arr[i].summary+"</td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							//+"<td>"+arr[i].detailSub+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' href='/WHCD/PersonCenter/SceneryModify?sceneryId="+arr[i].id+"'>修改</a>"
							+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\"/WHCD/PersonCenter/DeleteScenery\")'>删除</a>"
							+"</td>"
							+"</tr>"
							htmlStr+=tmpStr;
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 		}
	 	}
		
		function GetPersonCenterSceneryList(){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum,"userParam":"userParam"},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'>"+arr[i].summary+"</a></td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							//+"<td>"+arr[i].detailSub+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' href='/WHCD/PersonCenter/SceneryModify?sceneryId="+arr[i].id+"'>修改</a>"
							+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\"/WHCD/PersonCenter/DeleteScenery\")'>删除</a>"
							+"</td>"
							+"</tr>"
							htmlStr+=tmpStr;
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 	}
		
		function DeleteScenery(sceneryId,urlStr){
			$.ajax({
				url : urlStr,
				async : false,
				data:{"sceneryId":sceneryId},
				error : function() {
					alert("删除失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('删除成功');
				else
					alert('删除成功');
				window.location.reload();
				}
			});
		}
		//管理员中心获取用户列表
		function GetUserListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:"/WHCD/Manager/getUserList",
				async : false,
				dataType : 'json',
				data:{"page":1},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.userList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.userList;
					var htmlStr="";
					var tmpStr="";
					$("#usrPanelContent table").append(select);
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/Manager/DetailUserInfo?mail="+arr[i].mail+"'></a>"+arr[i].mail+"</td>"
							+"<td>"+arr[i].name+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' onclick='InitializeUserPassword(\""+arr[i].mail+"\")'>初始化密码</a>";
						if(arr[i].isUsed==1)
							tmpStr+="<a class='btn btn-danger' onclick='Disable(\""+arr[i].mail+"\")' >禁用</a>";
						else
							tmpStr+="<a class='btn btn-success' onclick='Able(\""+arr[i].mail+"\")' >解禁</a>";
						
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 		}
	 	}
		
		function GetUserList(){
			$.ajax({
				type : "post",
				url:"/WHCD/Manager/getUserList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.userList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.userList;
					var htmlStr="";
					var tmpStr="";
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/Manager/DetailUserInfo?mail="+arr[i].mail+"'></a>"+arr[i].mail+"</td>"
							+"<td>"+arr[i].name+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' onclick='InitializeUserPassword(\""+arr[i].mail+"\",\"/WHCD/Manager/DisableUser\")'>初始化密码</a>";
						if(arr[i].isUsed==1)
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='Disable(\""+arr[i].mail+"\",\"/WHCD/Manager/DisableUser\")' >禁用</a>";
						else
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='Able(\""+arr[i].mail+"\",\"/WHCD/Manager/AbleUser\")' >解禁</a>";
						
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 	}
		
		function DisableUser(mail,urlStr){
			var urlStr="<%=request.getContextPath()%>/Manager/DisableUser";	
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"mail" : mail
				},
				error : function() {
					alert("禁用失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('禁用成功');
				else
					alert('禁用失败');
				window.location.reload();
				}
			});
		}
		function AbleUser(mail,urlStr){
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"mail" : mail
				},
				error : function() {
					alert("解禁失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('解禁成功');
				else
					alert('解禁失败');
				window.location.reload();
				}
			});
		}
		
		function AddUser(urlStr){
			var mail=$("#mail").val();
			alert(mail);
			var password=$("#password").val();
			var identity=$("input[name='identity']").val();
			var sex=$("input[name='sex']").val();
			var name=$("#name").val();
			
			$('#addUserModel').modal('hide')
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"mail" : mail,
					"name":name,
					"sex":sex,
					"identity":identity,
					"password":password
				},
				error : function() {
					alert("添加失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('添加成功！');
					else
						alert('添加失败！');
				window.location.reload();
				}
			});
			
		}
		function  InitializeUserPassword(mail,urlStr){
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"mail" : mail
				},
				error : function() {
					alert("初始化密码失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('初始化密码成功！');
				else
					alert('初始化密码失败！');
				window.location.reload();
				}
			});
		}
		//获取所有风景名胜
		function GetManagerSceneryListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1,"managerParam":"managerParam"},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					$("#usrPanelContent table").append(select);
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'></a>"+arr[i].summary+"</td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							+"<td>"+arr[i].userName+"</td>"
							+"<td>"+arr[i].createDate+"</td>";
						if(arr[i].isAudited==1)
							tmpStr+="<td>通过</td>";
						else if(arr[i].isAudited==-1)
							tmpStr+="<td>不通过</td>";
						else 
							tmpStr+="<td>待审核</td>";
						tmpStr+="<td>"+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\"/WHCD/PersonCenter/DeleteScenery\")'>删除</a>";
						
						if(arr[i].isAudited==1)
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='AuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/AuditScenery\")' >通过</a>";
						else if(arr[i].isAudited==-1)
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='DisAuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/DisAuditScenery\")' >不通过</a>";
						else
							{
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='AuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/AuditScenery\")' >通过</a>";
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='DisAuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/DisAuditScenery\")' >不通过</a>";
							}
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 		}
	 	}
		
		function GetManagerSceneryList(){
			$.ajax({
				type : "post",
				url:"/WHCD/Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum,"managerParam":"managerParam"},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					var numPage=data.numPage;
					var len=data.sceneryList.length;
					var total=data.total;
					var page=data.page;
					var arr=data.sceneryList;
					var htmlStr="";
					var tmpStr="";
					for(var i=0;i <len&&i<numPage;i++){
						tmpStr="<tr>"
							+"<td><a href='/WHCD/PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'></a>"+arr[i].summary+"</td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							+"<td>"+arr[i].userName+"</td>"
							+"<td>"+arr[i].createDate+"</td>";
						if(arr[i].isAudited==1)
							tmpStr+="<td>通过</td>";
						else if(arr[i].isAudited==-1)
							tmpStr+="<td>不通过</td>";
						else 
							tmpStr+="<td>待审核</td>";
						tmpStr+="<td>"+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\"/WHCD/PersonCenter/DeleteScenery\")'>删除</a>";
						
						if(arr[i].isAudited==1)
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='AuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/AuditScenery\")' >通过</a>";
						else if(arr[i].isAudited==-1)
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='DisAuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/DisAuditScenery\")' >不通过</a>";
						else
							{
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='AuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/AuditScenery\")' >通过</a>";
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='DisAuditScenery(\""+arr[i].id+"\",\"/WHCD/Manager/DisAuditScenery\")' >不通过</a>";
							}
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
					var str="";
					for(var j=1;j<=total;j++){
						if(j===page){
							str+="<option value='"+j+"' selected='selected'>"+j+"</option>";
						}
						else
							str+="<option value="+j+">"+j+"</option>";
					}
					var select="<hr align='left' width='100%' size='15' />"
					+"<div class='col-lg-8 col-lg-offset-3'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetPersonCenterSceneryList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetPersonCenterSceneryList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetPersonCenterSceneryList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 	}
		
		// 动态的显示图片
		function GetFilePath() {
			var addr = null;
			var docObj = document.getElementById("imgUpLoad");

			var imgObjPreview = document.getElementById("preview");
			if (docObj.files && docObj.files[0]) {
				//火狐下，直接设img属性
				imgObjPreview.style.display = 'block';
				//imgObjPreview.src = docObj.files[0].getAsDataURL();

				//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
				imgObjPreview.src = window.URL
						.createObjectURL(docObj.files[0]);
				addr = imgObjPreview.src;
			} else {
				//IE下，使用滤镜
				docObj.select();
				var imgSrc = document.selection.createRange().text;
				//图片异常的捕捉，防止用户修改后缀来伪造图片
				try {
					localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
					localImagId.filters
							.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
					addr = imgSrc;
					//alert(imgSrc);
				} catch (e) {
					alert("您上传的图片格式不正确，请重新选择!");
					return false;
				}
				imgObjPreview.style.display = 'none';
				document.selection.empty();
			}
			return addr;
		}

		function PreView() {
			var addr = GetFilePath();
			$("#preview").attr("src", addr);
		}
		
		function Create(){
			var str=$(".wysiwyg-editor").html();
			//alert(str);
			$("#richText").val(str);
			var strNew=RegText(".wysiwyg-editor");
			var strFinal=SpiltStr(strNew);
			$("#detailSub").val(strFinal);
			$("#sceneryForm").submit();
		}
		
		$(":file").filestyle({buttonName: "btn-primary"});		
		// 动态显示图片结束		
		
		/// 登陆退出开始
		function login(url) {		
			var mail=$("#mailLogin").val();
			var password=$("#passwordLogin").val();			
			$.ajax({
				url : url,
				async : false,
				data:{"mail":mail,"password":password},
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status!==''){
						window.location.href=data
					}
					else if(status==='0'){
						$("#error").html("邮箱或密码输入有误！");
					}
					else if(status==='-1'){
						$("#error").html("该用户已被禁用！");
					}
						
				}
			});
		}
		function logout(url){
			
			$.ajax({
				url : url,
				async : false,
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status==='1'){
						alert("退出成功!");
						window.location.href="";
					}
					else{
						alert("退出失败!");
					}
						
				}
			});
		}
		//  登陆退出 结束