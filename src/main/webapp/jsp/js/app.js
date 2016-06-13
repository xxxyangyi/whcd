$(document).ready(function() {

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
																			+ "<a href='http://localhost:8080/WHCD/activity/getActivityVotes?activity_id="+msg[i].id+"'> "
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
																			+ "<a href='http://localhost:8080/WHCD/activity/getActivityVotes?activity_id="+msg[i].id+"'> "
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
	
	
})
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
					