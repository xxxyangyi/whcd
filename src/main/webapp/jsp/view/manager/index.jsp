<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User manager = (User)session.getAttribute("expert");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台系统首页</title>
</head>

<body>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />
					<div class="panel-body">
						<div style="width: 200px;margin: 0px auto; "><h3>欢迎！<s:property value="#session.get('user').getName()"></s:property>登陆</h3></div>
						<div style="float: left;">
							<div>
								<div style="float:left">性别比例</div>
								<div style="float:right">
									<div style="margin-bottom: 5px">
										<span>用户男</span><img src="/WHCD/jsp/img/userM.png" />
									</div>
									<div>
										<span>用户女</span><img src="/WHCD/jsp/img/userW.png" />
									</div>
								</div>
							</div>
							
							<div id="canvasUserSex" >
                        		<canvas id="canvasUserSexArea" width="300" height="300"/>
                        
        					</div>
        					<script type="text/javascript" src="<%=basePath%>jsp/js/jquery-2.1.4.js"></script>
							<script type="text/javascript">
		                          $("#canvasUserSex").ready(function(){
		                        	
		                        	    var man=0;
		                        	    var women=0;
		                        	    $.ajax({
		                    				url : "/WHCD/Manager/getSexData",
		                    				async : false,
		                    				error : function() {
		                    					alert("操作失败！");
		                    				},
		                    				success : function(data) {
		                    					man=data.man!==''?data.man:0;
		                    					women=data.women!==''?data.women:0;
		                    					var pieData = [
				    		                                   {
				    		                                           value: man,
				    		                                           color:"#FABC3D",
				    		                                           highlight: "#BE3286",
				    		                                           label: "用户男"
				    		                                   },
				    		                                   {
				    		                                           value: women,
				    		                                           color: "#25B7D3",
				    		                                           highlight: "#BE3286",
				    		                                           label: "用户女"
				    		                                   }

				    		                           ]; 
				                        	  
				                        	   var ctxUserSex = document.getElementById("canvasUserSexArea").getContext("2d");
			                                   window.myPie = new Chart(ctxUserSex).Pie(pieData);
		                    				}
		                    			});
								});
							</script>
						</div>
						<div style="float:right;">
							<div>
								<div style="float:left">职业比例</div>
								<div style="float:right">
									<div style="margin-bottom: 5px">
										<span>专家</span><img src="/WHCD/jsp/img/authorM.png" />
									</div>
									<div>
										<span>游客</span><img src="/WHCD/jsp/img/touristM.png" />
									</div>
								</div>
							</div>
							<div id="canvasIdentity" >
                        		<canvas id="canvasIdentityArea" width="300" height="300"/>
                        
        					</div>
							<script type="text/javascript">
		                
		                          $("#canvasIdentity").ready(function(){
		                        	 
		                        	    var user=0;
		                        	    var expert=0;
		                        	    $.ajax({
		                    				url : "/WHCD/Manager/getIdentityData",
		                    				async : false,
		                    				error : function() {
		                    					alert("操作失败！");
		                    				},
		                    				success : function(data) {
		                    					user=data.user!==''?data.user:0;
		                    					expert=data.expert!==''?data.expert:0;
		                    					var pieData = [
				    		                                   {
				    		                                           value: user,
				    		                                           color:"#E04F5F",
				    		                                           highlight: "#BE3286",
				    		                                           label: "游客"
				    		                                   },
				    		                                   {
				    		                                           value: expert,
				    		                                           color: "#32BEA6",
				    		                                           highlight: "#BE3286",
				    		                                           label: "专家"
				    		                                   }

				    		                           ]; 
				                        	  
				                        	   var ctxUserSex = document.getElementById("canvasIdentityArea").getContext("2d");
			                                   window.myPie = new Chart(ctxUserSex).Pie(pieData);
		                    				}
		                    			});
								});
							</script>
						</div>
						<div style="float: left;margin-left: 120px;margin-top: 20px;">
							<div style="text-align: center">12个月中数据创建折线图</div>
							<div>用户上传的各类风景饮食文化数据数量</div>
							<div id="canvasMonth" >
                        		<canvas id="canvasMonthArea" width="620" height="400" style="width: 620px; height: 400px;"/>
                        
        					</div>
        					<div style="float:right">月份</div>
							<script type="text/javascript">
		                
		                          $("#canvasMonth").ready(function(){
		                        	  	  
		                        	  $.ajax({
		                    				url : "/WHCD/Manager/getMonthData",
		                    				async : false,
		                    				error : function() {
		                    					alert("操作失败！");
		                    				},
		                    				success : function(data) {
		                    					var lineData = {
		                    						    labels:data.month,
		                    						    datasets: [
		                    						        {
		                    						            label: "12个月份用户创建总数据一览",
		                    						            fill: false,
		                    						            lineTension: 0.1,
		                    						            backgroundColor: "rgba(75,192,192,0.4)",
		                    						            borderColor: "rgba(75,192,192,1)",
		                    						            borderCapStyle: 'butt',
		                    						            borderDash: [],
		                    						            borderDashOffset: 0.0,
		                    						            borderJoinStyle: 'miter',
		                    						            pointBorderColor: "rgba(75,192,192,1)",
		                    						            pointBackgroundColor: "#fff",
		                    						            pointBorderWidth: 1,
		                    						            pointHoverRadius: 5,
		                    						            pointHoverBackgroundColor: "rgba(75,192,192,1)",
		                    						            pointHoverBorderColor: "rgba(220,220,220,1)",
		                    						            pointHoverBorderWidth: 2,
		                    						            pointRadius: 1,
		                    						            pointHitRadius: 10,
		                    						            data:data.scenerysum,
		                    						        }
		                    						    ]
		                    						};
		                                	  
				                        	   var ctxUserSex = document.getElementById("canvasMonthArea").getContext("2d");
			                                   window.myPie = new Chart(ctxUserSex).Line(lineData);
		                    				}
		                    			});
								});
							</script>
						</div>
					</div>
				</div>
</body>
</html>
