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
								htmlStr+="<li><a onclick='localStorage[\"tabId\"] = "+arr[i].id+";window.location.href=\"/jsp/view/scenery/sceneryList.jsp\"'>"+arr[i].name+"</a></li>"
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

		var activity ={
			// 添加活动
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
            },

            // 参加活动
			activityAdd : function (activityID) {
				if(activityID){
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
					$(this).find('.pass').eq(0).hide();
				} else if (isAudited == "0") {
					$(this).find('.isAudited').eq(0).text('待审核');
					$(this).find('.noPass').eq(0).hide();
				} else if (isAudited == "-1") {
					$(this).find('.isAudited').eq(0).text('不通过');
					$(this).find('.noPass').eq(0).hide();
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
		},

		auditScenery: function (sceneryId){
			var postData =  {"sceneryId":sceneryId}
			util.ajax("Scenery/auditScenery",postData,null,function (data) {
				if(data == "通过成功"){
					util.showMsg("通过成功!");
					$("#"+sceneryId).find('.isAudited').eq(0).text('通过');
					$("#"+sceneryId).find('.pass').eq(0).hide();
					$("#"+sceneryId).find('.noPass').eq(0).show();
				}else{
					util.showMsg("通过失败!")
					window.location.reload();
				}
			});
		},

		disAuditScenery:function (sceneryId) {
			var postData = {"sceneryId": sceneryId}
			util.ajax("Scenery/disAuditScenery", postData, null, function (data) {
				if (data == "不通过成功") {
					util.showMsg("[不通过]操作成功!");
					$("#"+sceneryId).find('.isAudited').eq(0).text('未通过');
					$("#"+sceneryId).find('.pass').eq(0).show();
					$("#"+sceneryId).find('.noPass').eq(0).hide();
				} else {
					util.showMsg("[不通过]操作失败!")
					window.location.reload();
				}
			});
		},

		goToSceneryDetail:function (sceneryId) {
			localStorage["sceneryId"] = sceneryId;
			window.location.href='/jsp/view/scenery/sceneryDetail.jsp';
		}
	}
