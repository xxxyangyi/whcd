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
<base href="<%=basePath%>">
<title>登录界面</title>
<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="jsp/js/jquery-2.1.4.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
<script src="jsp/js/app.js"></script>
</head>
<body>
	<div class="container" style="width:90%">
		<div>
			<h1>杨毅8376</h1>
		</div>
		<div class="login">
			<div>
				<h3>电影租赁系统</h3>
				<hr style="color: #000000">
			</div>

			<form action="<%=basePath%>Customer/login.action" method="post">
				<div class="input-group" style="margin-left: 15%;margin-right: auto">
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">用户名:</span>
						</div>
						<div class="col-lg-6">
							<input name="activity.activityName" type="text"
								class="form-control col-lg-6" placeholder="请输入用户名">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">密码:</span>
						</div>
						<div class="col-lg-6">
							<input name="cus.last_name" type="text"
								class="form-control col-lg-6" placeholder="密码">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 col-lg-offset-2">
							<button name="login_btn" type="submit" class="btn btn-info">确认登录</button>
						</div>
					</div>
			</form>

		</div>
	</div>
	</div>

</body>
</html>
