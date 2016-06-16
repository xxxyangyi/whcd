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

<title>My JSP 'addCustomer.jsp' starting page</title>

<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="jsp/js/jquery-2.1.4.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jsp/js/app.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
	/*background-color:#ffffff ;*/
}
</style>

</head>

<body>
	<nav class="navbar navbar-default f" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">杨毅8376</a>
		</div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Admin</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container id1" style="width:90%">
		<div class="row">
			<div class="col-lg-3">
				<ul>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" type="button" style="width: 150px">Customer管理</button>
						</div>
					</li>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" type="button" style="width: 150px">Film设置</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<h1>创建Customer</h1>
				</div>
				<div class="row">
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group form-group-sm" style="width: 200px">
							<span>基本信息</span>
						</div>
					</form>
				</div>

				<div class="input-group" style="margin-left: 15%;margin-right: auto">
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">First Name:</span>
						</div>
						<div class="col-lg-6">
							<input type="text" id="first_name" class="form-control col-lg-6"
								placeholder="First Name">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">Last Name:</span>
						</div>
						<div class="col-lg-6">
							<input type="text" id="last_name" class="form-control col-lg-6"
								placeholder="Last Name">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">Email:</span>
						</div>
						<div class="col-lg-6">
							<input type="text" id="emailinfo" class="form-control col-lg-6"
								placeholder="Email">
						</div>
					</div>
					<div class="row">
						<div class="col-lg-2">
							<span class="input-group-addon">Address:</span>
						</div>
						<div class="col-lg-6">
							<input type="text" id="address" class="form-control col-lg-6"
								placeholder="Address">
						</div>
					</div>


					<div class="row">
						<div class="col-lg-3 col-lg-offset-2">
							<input type="button" class="btn btn-info" id="submit" value="提交">
							<input type="button" class="btn btn-info" id="cancel" value="取消">
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	</div>
</body>
</html>
