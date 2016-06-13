<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script type="text/javascript" src="<%=basePath%>jsp/js/jquery-2.1.4.js"></script>
<script src="<%=basePath%>jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jsp/js/app.js"></script>
<base href="<%=basePath%>">
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">首页</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<%=request.getContextPath()%>/Scenery/SceneryList">名胜古迹 <span class="sr-only">(current)</span></a></li>
				<li><a href="<%=request.getContextPath()%>/jsp/view/activityShowList.jsp">投票系统</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("user") == null) {
				%>
				<li><a data-toggle="modal" data-target="#loginModal"
					data-whatever="@mdo">登录</a></li>
					<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">登录</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group  ">
							<label id="error" style="color: red;text-align: center;" class="control-label col-sm-10"></label>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">邮箱：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="mailLogin"
									aria-describedby="mailStatus">
							</div>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">密码：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="passwordLogin"
									aria-describedby="passwordStatus">
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<a  class="btn btn-primary" href="<%=request.getContextPath()%>/Home/Resister">注册</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="login('<%=path%>/Home/DoLogin');">登录</button>

				</div>
			</div>
		</div>
	</div>
				
					
				<%
					} else {
				%>
				<li class="dropdown"><a  class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">个人中心 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/PersonCenter/Index">中心首页</a></li>
						<li><a href="<%=request.getContextPath()%>/PersonCenter/ModifyInfo">修改个人信息</a></li>
						<li><a href="<%=request.getContextPath()%>/PersonCenter/CreateScenery">创建名胜古迹</a></li>
						<li><a href="#">创建投票信息</a></li>
						<li><a href="<%=request.getContextPath()%>/jsp/view/activityAdd.jsp">创建活动</a></li>						
						<li role="separator" class="divider"></li>
						<li><a onclick="logout('<%=path%>/Home/DoLogOut');">退出</a></li>
					</ul></li>
				<%
					}
				%>
			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<script type="text/javascript">
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
		
	</script>
</body>
