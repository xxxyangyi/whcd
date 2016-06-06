<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册页面</title>
<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="jsp/js/jquery-2.1.4.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jsp/js/app.js"></script>
</head>

<body>
	<jsp:include page="layout/nav_top.jsp"></jsp:include>

	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" type="button" style="width: 150px">其他</button>
						</div>
					</li>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" type="button" style="width: 150px">设置</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-md-8">
				<div class="row">
					<h1>注册</h1>
				</div>
				<hr align="left" width="100%" size="15" />
				<div class="row">
					<div class="col-lg-7 col-lg-offset-1">


						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">用户名：</label> <input type="text"
									class="form-control" id="userName" placeholder="用户名">
							</div>
							<div class="form-group">
								<div class="input-group">
									<div clas="row">
										<div class="col-lg-1">
											<input type="radio" name="sex" aria-label="...">
										</div>
										<div class="col-lg-3">男</div>
										<div class="col-lg-1">
											<input type="radio" name="sex" aria-label="...">
										</div>
										<div class="col-lg-3">女</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">邮箱地址：</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									placeholder="邮箱地址">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">密码：</label> <input
									type="password" class="form-control" id="Password"
									placeholder="密码">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword2">确认密码：</label> <input
									type="password" class="form-control" id="confirmPassword"
									placeholder="确认密码">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-lg-3 col-lg-offset-2">
										<button type="submit" class="btn btn-default">提交</button>
									</div>
									<div class="col-lg-3">
										<button type="reset" class="btn btn-default">重置</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

	</div>

	</div>
</body>
</html>
