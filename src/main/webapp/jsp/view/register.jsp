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

<title>注册页面</title>
<link rel="stylesheet" href="<%=basePath%>/jsp/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>/jsp/css/app.css">

<style type="text/css">
	.error{
		color:red;
		margin: 5px;
	}
</style>
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


						<form id="resistForm" action="<%=request.getContextPath()%>/Home/DoResister" method="post"> 
							<div class="form-group">
								<label for="exampleInputEmail1">邮箱地址：</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="mail" placeholder="邮箱地址">
							</div>
							<div class="form-group">
								<div class="input-group">
									<div clas="row">
										<div class="col-lg-1">
											<input type="radio" name="sex" value="1" aria-label="..." checked="checked">
										</div>
										<div class="col-lg-3">男</div>
										<div class="col-lg-1">
											<input type="radio" name="sex" value="0" aria-label="...">
										</div>
										<div class="col-lg-3">女</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">用户名：</label> <input type="text"
									name="name" class="form-control" id="userName"
									placeholder="用户名">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">密码：</label> <input
									type="password" name="password" id="password" class="form-control"
									id="Password" placeholder="密码">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword2">确认密码：</label> <input
									type="password" class="form-control" name="rePassword" id="rePassword"
									placeholder="确认密码">
							</div>
							<div class="form-group">
								<div class="input-group">
									<div clas="row">
										<div class="col-lg-1">
											<input type="radio" name="identity" value="1" aria-label="..."  checked="checked">
										</div>
										<div class="col-lg-3">游客</div>
										<div class="col-lg-1">
											<input type="radio" name="identity" value="0" aria-label="...">
										</div>
										<div class="col-lg-3">专家</div>
									</div>
								</div>
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
	<script type="text/javascript" src="<%=basePath%>/jsp/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>/jsp/js/additional-methods.js"></script>
	<script type="text/javascript">
	$().ready(
			function() {
				$("#resistForm").validate({
					rules : {
						mail : {
							required : true,
							email : true
						},
						password : {
							required : true,
							maxlength : 20,
							minlength : 8,
							chrnum : true
						},
						rePassword : {
							required : true,
							chrnum : true,
							equalTo : "#password"
						}
					},
					messages : {
						mail : {
							required : "邮箱不能为空",
							email : "邮箱格式有误"
						},
						password : {
							required : "密码不能为空",
							maxlength : "密码至多为20位",
							minlength : "密码至少为8位",
						},
						rePassword : {
							required : "确认密码不能为空",
							equalTo : "两次输入密码不相同"
						}
					}
				});
				jQuery.validator.addMethod("chrnum", function(value, element) {
					var chrnum = /^([a-zA-Z0-9]+)$/;
					return this.optional(element) || (chrnum.test(value));
				});
			});
				
	</script>
	
</body>
</html>
