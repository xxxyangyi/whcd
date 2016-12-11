var url_perfix = "http://localhost:8080/";
var util = {
	alert:function (msg) {
		console.log(msg)
	},
    showMsg : function (msg) {
        console.log(msg)
    },
	ajax: function (apiName, postData,dataType,callback, method, timeout) {
		// 默认下发POST请求
		method = method || 'POST';
		// 默认超时60秒
		timeout = timeout || 60000;

		util.alert("接口：" + apiName + " postData：" + postData);

		$.ajax({
			type: method,
			async: true,
			url: apiName,
			dataType: dataType,
			data: postData,
			timeout: timeout,
			beforeSend: function (request) {

			},
			/* 成功时直接返回数据 */
			success: function (data, textStatus, jqXHR) {
				util.alert("接口：" + apiName + " 返回数据：" + JSON.stringify(data));
				if(data=="特殊情况"){
					util.alert("进行特殊情况处理")
				}
				callback(data);
			},

			/* 失败时返回默认错误 */
			error: function (jqXHR, textStatus, errorThrown) {
				if (jqXHR.textStatus == "error") {
					util.alert("网络请求失败!");
				}
			}
		});
	},
}

window.onload=function() {

    // 调用 激活菜单的方法
    menuActive()

	//通过判断 activity_list 标签是否存在 ，判断是否要请求加载 活动清单数据
	if ($("#activity_list").length > 0) {
		console.log("activity_list 存在：请求数据");
		$.ajax({
			type : "post",
			data : {},
			url : url_perfix + "activity/getActivitys",
			async : false,
			dataType : 'json',
			success : function(msg) {
				if (msg) {
					console.log("请求数据成功： "+ msg.length);
					var i = 0;
					for (i; i < msg.length; i++) {
						if (i%2 == 0) {
							$("#activity_list").append(
																	"<div class='col-lg-10'>"
																			+ "<div class='panel panel-default'>"
																			+ "<div class='panel-body'>"
																			+ "<div class='media'>"
																			+ "<div class='media-left media-middle'>"
																			+ "<img class='media-object ' height='100px'"
																			+ "width='100px' src='jsp/image/sky.jpg' alt='...'>"
																			+ "</div>"
																			+ "<div class='media-body'>"
																			+ "<h4 class='media-heading'>"
																			+ "<a href='"+ url_perfix +"activity/getActivityVotesPassed?activity_id="+msg[i].id+"'> "
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
																			+ "<a href='"+ url_perfix +"activity/getActivityVotesPassed?activity_id="+msg[i].id+"'> "
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
			url : url_perfix + "activity/getActivitys",
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
																			+ "<a href='"+ url_perfix +"activity/getActivityVotesPassed?activity_id="+msg[i].id+"'> "
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
			url : url_perfix + "Scenery/SceneryListGson",
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
							
					}				
				} else {
					console.log("请求数据失败： "+ msg);
				}
			}
		})	
		} else {
			console.log("home_activity_list 不存在：不请求数据");
		}

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
			url : url_perfix + "activity/voteFor",
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
			for(;str.charCodeAt(i)>255&&i<101;i++);
			
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
	    function GetSceneryListOne(tabid){
	        alert("function GetSceneryListOne(tabid)： 这个地方是否可以不要")
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:url_perfix + "Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1,'tabid':tabid},
				error : function() {
					alert("ajax出错！ GetSceneryListOne");
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
						+"<div class='panel-body' >"
						+"<div class='media'>"
						+"<div class='media-body'>"
						+"<h4 class='media-heading'>"
						+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
						+arr[i].summary
						+"</a>"
						+"</h4>"
						+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
						+arr[i].detailSub
						+"</p>"
						+"</div>"
						+"<div class='media-right media-middle'>"
						+"<a> <img class='media-object' style='margin-top: 20px;'  src='"+ url_perfix +arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src="+ url_perfix +"/jsp/img/errorimg.jpg\"' /></a>"
						+"</div></div></div></div></div>";
						}
					else{
							tmpStr="<div class='row'>"
										+"<div class='col-lg-12'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-body' >"
										+"<div class='media'>"
										+"<div class='media-left media-middle'>"
										+"<a> <img class='media-object' style='margin-top: 20px;'  src='"+ url_perfix +arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src="+ url_perfix +"jsp/img/errorimg.jpg\"' /></a>"
										+"</div>"
										+"<div class='media-body'>"
										+"<h4 class='media-heading'>"
										+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
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
					+"<a onclick='PrePage();GetSceneryList(\""+tabid+"\");' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetSceneryList(\""+tabid+"\")'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetSceneryList(\""+tabid+"\")' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					htmlStr+=select;
					$("#usrPanelContent").html(htmlStr);
				}
			});
	 		}
	 	}
	 	
		function GetSceneryList(tabid){
			$.ajax({
				type : "post",
				url:url_perfix + "Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum,'tabid':tabid},
				error : function() {
					alert("ajax出错！ GetSceneryList");
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
					 tmpStr="<div class='row'><div class='col-lg-10 col-lg-offset-2'>"
						+"<div class='panel panel-default'>"
						+"<div class='panel-body' >"
						+"<div class='media'>"
						+"<div class='media-body'>"
						+"<h4 class='media-heading'>"
						+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
						+arr[i].summary
						+"</a>"
						+"</h4>"
						+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
						+arr[i].detailSub
						+"</p>"
						+"</div>"
						+"<div class='media-right media-middle'>"
						+"<a> <img class='media-object' style='margin-top: 20px;'  src='"+ url_perfix +arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\""+ url_perfix +"jsp/img/errorimg.jpg\"' /></a>"
						+"</div></div></div></div></div></div>";
						}
					else{
							tmpStr="<div class='row'>"
										+"<div class='col-lg-10'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-body' >"
										+"<div class='media'>"
										+"<div class='media-left media-middle'>"
										+"<a> <img class='media-object' style='margin-top: 20px;'  src="+ url_perfix +arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src="+ url_perfix +"jsp/img/errorimg.jpg\"' /></a>"
										+"</div>"
										+"<div class='media-body'>"
										+"<h4 class='media-heading'>"
										+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
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
					+"<a onclick='PrePage();GetSceneryList(\""+tabid+"\");' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetSceneryList(\""+tabid+"\")'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetSceneryList(\""+tabid+"\")' class='btn btn-primary'>下一页</a>"
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
				url:url_perfix + "Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1,"userParam":"userParam"},
				error : function() {
					alert("ajax出错！ GetPersonCenterSceneryListOne");
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
							+"<td><a href='"+ url_perfix +"PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'></a>"+arr[i].summary+"</td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							//+"<td>"+arr[i].detailSub+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' href='"+ url_perfix +"PersonCenter/SceneryModify?sceneryId="+arr[i].id+"'>修改</a>"
							+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\""+url_perfix+"PersonCenter/DeleteScenery\")'>删除</a>"
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
				url:url_perfix + "Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum,"userParam":"userParam"},
				error : function() {
					alert("ajax出错！ GetPersonCenterSceneryList");
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
							+"<td><a href='"+ url_perfix +"PersonCenter/SceneryDetail?sceneryId="+arr[i].id+"'>"+arr[i].summary+"</a></td>"
							+"<td><p style='width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis'>"+arr[i].detailSub+"</p></td>"
							//+"<td>"+arr[i].detailSub+"</td>"
							+"<td>"
							+"<a class='btn btn-warning' href='"+ url_perfix +"PersonCenter/SceneryModify?sceneryId="+arr[i].id+"'>修改</a>"
							+"<a class='btn btn-danger' style='margin-left:5px;' onclick='DeleteScenery(\""+arr[i].id+"\",\""+ url_perfix +"PersonCenter/DeleteScenery\")'>删除</a>"
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
		

		//管理员中心获取用户列表
		function GetUserListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:url_perfix + "Manager/getUserList",
				async : false,
				dataType : 'json',
				data:{"page":1},
				error : function() {
					alert("ajax出错！ GetUserListOne");
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
							+"<td><a href='"+ url_perfix +"Manager/DetailUserInfo?mail="+arr[i].mail+"'></a>"+arr[i].mail+"</td>"
							+"<td>"+arr[i].name+"</td>";
						if(arr[i].isUsed==1)
							tmpStr+="<td>可以使用</td>";
						else
							tmpStr+="<td>已禁用</td>";
						tmpStr+="<td>"
							  +"<a class='btn btn-warning btn-xs' onclick='InitializeUserPassword(\""+arr[i].mail+"\")'>初始化密码</a>";
						if(arr[i].isUsed==1)
							tmpStr+="<a class='btn btn-danger btn-xs' style='margin-left:5px' onclick='DisableUser(\""+arr[i].mail+"\")' >禁用</a>";
						else
							tmpStr+="<a class='btn btn-success btn-xs' style='margin-left:5px' onclick='AbleUser(\""+arr[i].mail+"\")' >解禁</a>";
						
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
					+"<div class='col-lg-8 col-lg-offset-3' style='margin-bottom:5px'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetUserList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetUserList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetUserList();' class='btn btn-primary'>下一页</a>"
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
				url:url_perfix + "Manager/getUserList",
				async : false,
				dataType : 'json',
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！ GetUserListOne");
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
							+"<td><a href='"+ url_perfix +"Manager/DetailUserInfo?mail="+arr[i].mail+"'></a>"+arr[i].mail+"</td>"
							+"<td>"+arr[i].name+"</td>";
						if(arr[i].isUsed==1)
							tmpStr+="<td>可以使用</td>";
						else
							tmpStr+="<td>已禁用</td>";
						tmpStr+="<td>"
							  +"<a class='btn btn-warning' onclick='InitializeUserPassword(\""+arr[i].mail+"\")'>初始化密码</a>";
						if(arr[i].isUsed==1)
							tmpStr+="<a class='btn btn-danger' style='margin-left:5px' onclick='DisableUser(\""+arr[i].mail+"\")' >禁用</a>";
						else
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='AbleUser(\""+arr[i].mail+"\")' >解禁</a>";
						
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
					+"<div class='col-lg-8 col-lg-offset-3' style='margin-bottom:5px'>"
					+"<div class='col-lg-2'>"
					+"<a onclick='PrePage();GetUserList();' class='btn btn-primary'>上一页</a>"
					+"</div>"
					+"<div class='col-lg-3'>"
					+"<select id='selectPage' class='form-control' onchange='SelectedPage();GetUserList();'>"
					+str
					+"</select>"
					+"</div>"
					+"<div class='col-lg-2'>"
					+"<a onclick='NextPage("+total+");GetUserList();' class='btn btn-primary'>下一页</a>"
					+"</div>"
					+"</div>";
					//htmlStr+=select;
					$("#usrPanelContent .col-lg-8").remove();
					$("#usrPanelContent hr").remove();
					$("#usrPanelContent").append(select);
				}
			});
	 	}
		
		function DisableUser(mail){
			$.ajax({
				url : url_perfix + "Manager/DisableUser",
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
		function AbleUser(mail){
			$.ajax({
				url : url_perfix + "Manager/AbleUser",
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
		
		function AddUser(){
			var mail=$("#mail").val();
			var password=$("#password").val();
			var identity=$("input[name='identity']:checked").val();
			var sex=$("input[name='sex']").val();
			var name=$("#name").val();
			
			$('#addUserModel').modal('hide')
			$.ajax({
				url : url_perfix + 'Manager/AddUser',
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
		function  InitializeUserPassword(mail){
			$.ajax({
				url : url_perfix + "Manager/InitializeUserPassword",
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
		
		//管理员中心获取菜单列表
		function GetTabListOne(){
	 		if(currentNum==1){
			$.ajax({
				type : "post",
				url:url_perfix + "Manager/getTabList",
				async : false,
				dataType : 'json',
				error : function() {
					alert("ajax出错！ GetUserListOne");
				},
				success : function(data) {
					var len=data.tabList.length;
					var arr=data.tabList;
					var htmlStr="";
					var tmpStr="";
					for(var i=0;i <len;i++){
						tmpStr="<tr>"
							+"<td>"+arr[i].name+"</td>";
						if(arr[i].position===0)
							tmpStr+="<td>顶部菜单</td>";
						else
							tmpStr+="<td>侧部菜单</td>";
						tmpStr+="<td>";
						if(arr[i].isUsed==1){
							tmpStr+="<a class='btn btn-danger btn-xs'  onclick='DisableTab(\""+arr[i].id+"\")' >禁用</a>"
							      +"<a class='btn btn-warning btn-xs' style='margin-left:5px' href='"+ url_perfix +"Manager/ModifyTabInfo?id="+arr[i].id+"' >修改</a>";
						}
						else
							tmpStr+="<a class='btn btn-success btn-xs' style='margin-left:5px' onclick='AbleTab(\""+arr[i].id+"\")' >解禁</a>";
						
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
				}
			});
	 		}
	 	}
		
		function GetTabList(){
			$.ajax({
				type : "post",
				url:url_perfix + "Manager/getTabList",
				async : false,
				dataType : 'json',
				error : function() {
					alert("ajax出错！ GetUserListOne");
				},
				success : function(data) {
					var len=data.tabList.length;
					var arr=data.tabList;
					var htmlStr="";
					var tmpStr="";
					for(var i=0;i <len;i++){
						tmpStr="<tr>"
							+"<td>"+arr[i].name+"</td>";
						if(arr[i].position===0)
							tmpStr+="<td>顶部菜单</td>";
						else
							tmpStr+="<td>侧部菜单</td>";
						tmpStr+="<td>";
						if(arr[i].isUsed==1){
							tmpStr+="<a class='btn btn-danger'  onclick='DisableTab(\""+arr[i].id+"\")' >禁用</a>"
							 +"<a class='btn btn-warning' style='margin-left:5px' href='"+ url_perfix +"Manager/ModifyTabInfo?id="+arr[i].id+"' >修改</a>";
						}
						else
							tmpStr+="<a class='btn btn-success' style='margin-left:5px' onclick='AbleTab(\""+arr[i].id+"\")' >解禁</a>";
						
							htmlStr+=tmpStr+"</td>"+"</tr>";
					}
					$("#usrPanelContent tbody").html(htmlStr);
				}
			});
	 	}
		function GetTabData(){
			$.ajax({
				type : "post",
				url:url_perfix + "Manager/getTabList",
				async : false,
				dataType : 'json',
				error : function() {
					alert("ajax出错！ GetTabData");
				},
				success : function(data) {
					var len=data.tabList.length;
					var arr=data.tabList;
					var htmlStr="";
					var tmpStr="";
					
					for(var i=0;i <len;i++){
						htmlStr+="<option value='"+arr[i].id+"'>"+arr[i].name+"</option>"
					}
					$("#tab").html(htmlStr);
				}
			});
	 	}
		
		function AbleTab(id){
			$.ajax({
				url : url_perfix + "Manager/AbleTab",
				async : false,
				data : {
					"id" : id
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
		
		function DisableTab(id){
			$.ajax({
				url : url_perfix + "Manager/DisableTab",
				async : false,
				data : {
					"id" : id
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
		
		function AddTab(){
			var name=$("#name").val();
			var position=$("input[name='position']:checked").val();
			alert("position:"+position);
			$('#addUserModel').modal('hide')
			$.ajax({
				url : url_perfix + "Manager/AddTab",
				async : false,
				data : {
					"position" : position,
					"name":name
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
			// url_perfix + "
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
					if(status=='0'){
						$("#error").html("邮箱或密码输入有误！");
					}
					else if(status=='-1'){
						$("#error").html("该用户已被禁用！");
					}
					else if(status!==''){
						 window.location.href = data
					 }
						
				}
			});
		}
		function logout(url){
			// url_perfix + "
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

		function AuditScenery(sceneryId,urlStr){
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"sceneryId" : sceneryId
				},
				error : function() {
					alert("操作失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('操作成功！');
				else
					alert('操作失败！');
				window.location.reload();
				}
			});
		}
		
		function DisAuditScenery(sceneryId,urlStr) {
			$.ajax({
				url : urlStr,
				async : false,
				data : {
					"sceneryId" : sceneryId
				},
				error : function() {
					alert("操作失败！");
				},
				success : function(data) {
					if(data==='1')
						alert('操作成功！');
				else
					alert('操作失败！');
				window.location.reload();
				}
			});
		}
		
		//获取顶部菜单
		function getTopMenu() {
			$.ajax({
				type : "post",
				url:url_perfix+"Manager/getTabList",
				async : false,
				dataType : 'json',
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("ajax出错！ getTopMenu");
				},
				complete: function(XMLHttpRequest, textStatus) {
					this; // 调用本次AJAX请求时传递的options参数
				},
				success : function(data) {
					var len=data.tabList.length;
					if(len != 0){
						var arr=data.tabList;
						var htmlStr="";
						var tmpStr="";
						tmpStr=$("#topMenuList").html();
						for(var i=0;i <len;i++){
							if(arr[i].position===0&&arr[i].isUsed===1)
								// htmlStr+="<li><a href='/WHCD/Scenery/SceneryList?tabid="+arr[i].id+"'>"+arr[i].name+"</a></li>"
								htmlStr+="<li><a href='"+ url_perfix +"Scenery/SceneryList?tabid="+arr[i].id+"'>"+arr[i].name+"</a></li>"
						}
						tmpStr+=htmlStr;
						$("#topMenuList").html(tmpStr);
					}

				}
			});
		} 
		
		//获取侧栏菜单
		function getSideMenu() {
			$.ajax({
				type : "post",
				url:url_perfix + "Manager/getTabList",
				async : false,
				dataType : 'json',
				error : function() {
					alert("ajax出错！ getSideMenu");
				},
				success : function(data) {
					var len=data.tabList.length;
					var arr=data.tabList;
					var htmlStr="";
					var tmpStr="";
					tmpStr=$("#sideMenuList").html();
					for(var i=0;i <len;i++){
						if(arr[i].position===1&&arr[i].isUsed===1)
						htmlStr+="<a class='list-group-item' href='"+ url_perfix +"Scenery/SceneryList?tabid="+arr[i].id+"'>"+arr[i].name+"</a>"
					}
					tmpStr+=htmlStr;
						$("#sideMenuList").html(tmpStr);
				}
			});
		} 

		function getSceneryDataHomePage() {
			$.ajax({
				type : "post",
				url:url_perfix + "Scenery/getSceneryList",
				async : false,
				dataType : 'json',
				data:{"page":1},
				error : function() {
					alert("ajax出错！ getSceneryDataHomePage");
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
					if(i==0){
					 tmpStr="<div class='row'><div class='col-lg-12'>"
						+"<div class='panel panel-default'>"
						+"<div class='panel-body' >"
						+"<div class='media'>"
						+"<div class='media-body'>"
						+"<h4 class='media-heading'>"
						+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
						+arr[i].summary
						+"</a>"
						+"</h4>"
						+"<p style='width:470px;word-wrap:break-word;text-overflow:ellipsis'>"
						+arr[i].detailSub
						+"</p>"
						+"</div>"
						+"<div class='media-right media-middle'>"
						+"<a> <img class='media-object' style='margin-top: 20px;'  src='"+ url_perfix +arr[i].picaddr+"' onload='AutoResizeImage(100,100,this)' onerror='javascript:this.src=\""+ url_perfix +"jsp/img/errorimg.jpg\"' /></a>"
						+"</div></div></div></div></div></div>";
						}
					else{
							tmpStr="<div class='row'>"
										+"<div class='col-lg-12'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-body'>"
										+"<div class='media'>"
										+"<div class='media-body'>"
										+"<h4 class='media-heading'>"
										+"<a href='"+ url_perfix +"Scenery/SceneryDetail?sceneryId="+arr[i].id+"'>"
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
					
					$("#sceneryHomePage").html(htmlStr);
				}
			});
		}


		var activity ={

            activityAdd:function () {
                var activityName = $("#activityName").val().trim();
                var activityContext = $("#activityContext").val().trim();
                var activityStartTime = $("#activityStartTime").val().trim();
                var activityEndTime = $("#activityEndTime").val().trim();

                if(activityName == "" || activityContext == "" || activityStartTime == "" || activityEndTime == ""){
                    util.showMsg("参数错误,请重新填写")
                    return;
                }else {
                    var postDate = {
                        "activityName":activityName,
                        "activityContext":activityContext,
                        "activityStartTime":activityStartTime,
                        "activityEndTime":activityEndTime
                    }
                    util.ajax("activity/activityAdd",postDate,null,function (data) {
                    	if(data == "添加活动成功"){
							util.showMsg("添加活动成功!")
						}else{
							util.showMsg("添加活动失败!")
							window.location.reload();
						}
                    })
                }

            }
        }

	var scenery ={

		isAuditedToString:function () {
			util.alert("isAuditedToString 方法执行");
			$(".sceneryListPaging_Tr").each(function() {
				var isAudited = $(this).find('.isAudited').eq(0).text();
				if (isAudited == "1") {
					$(this).find('.isAudited').eq(0).text('通过');
					$(this).find('.pass').eq(0).remove();
				} else if (isAudited == "0") {
					$(this).find('.isAudited').eq(0).text('待审核');
					$(this).find('.noPass').eq(0).remove();
				} else if (isAudited == "-1") {
					$(this).find('.isAudited').eq(0).text('不通过');
					$(this).find('.noPass').eq(0).remove();
				}
			})
		},
		deleteScenery:function (sceneryId){
			var postData =  {"sceneryId":sceneryId}
			util.ajax("Scenery/deleteScenery",postData,null,function (data) {
				if(data == "删除成功"){
					util.showMsg("删除成功!");
					$("#"+sceneryId).remove();
				}else{
					util.showMsg("删除失败!")
					window.location.reload();
				}
			});
		}
	}
