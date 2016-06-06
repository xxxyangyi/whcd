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
<script src="/jsp/js/jquery-2.1.4.min.js"></script>
<script src="/jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/jsp/js/app.js"></script>


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
				<li class="active"><a href="#">名胜古迹 <span class="sr-only">(current)</span></a></li>
				<li><a href="#">投票系统</a></li>
				<!-- <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" data-toggle="modal" data-target="#loginModal" data-whatever="@mdo">登录</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">个人中心 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">修改个人信息</a></li>
						<li><a href="#">创建名胜古迹</a></li>
						<li><a href="#">创建投票信息</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">退出</a></li>
					</ul></li>
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
							<label class="control-label col-sm-3" >用户名：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="inputSuccess3"
									aria-describedby="inputSuccess3Status">
							</div>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3" >密码：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="inputSuccess3"
									aria-describedby="inputSuccess3Status"> 
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">登录</button>

				</div>
			</div></div>
		</div>
</body>