<%@page import="com.hand.entity.Scenery"%>
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

<title>首页</title>
</head>

<body>
			<div class="col-md-10" style="background-color: white;">
	<h2 style="display: inline-block;">用户管理</h2><div style="float:right;display: inline-block;margin-top: 20px;"><a  data-toggle="modal" data-target="#addUserModel" ata-whatever="@mdo" class="btn btn-info">添加</a></div>
	<div id="usrPanelContent">
	<table class="table table-hover" style="text-align:center;">
		<thead >
			<tr>
				<th style="text-align:center;">邮箱</th>
				<th style="text-align:center;">用户名</th>
				<th style="text-align:center;">用户状态</th>
				<th style="text-align:center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<script type="text/javascript">
					GetUserListOne();
			</script>
		</tbody>
		
		</table>
		</div>
		</div>
	<div class="modal fade" id="addUserModel" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加新用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group  ">
							<label id="error" style="color: red;text-align: center;" class="control-label col-sm-10"></label>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">邮箱：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="mail" />
							</div>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">密码：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="password" />
							</div>
						</div>
						<div class="form-group">
								
									<label class=" col-sm-3" style="text-align: right;">性别：</label>
									<div class="col-sm-7">
										<div class="col-sm-1">
											<input type="radio" name="sex" value="1" aria-label="..." checked="checked">
										</div>
										<div class="col-sm-1">男</div>
										<div class="col-sm-1">
											<input type="radio" name="sex" value="0" aria-label="...">
										</div>
										<div class="col-sm-1">女</div>
									</div>
						</div>
						<div class="form-group">
								<label class="control-label col-sm-3">用户名：</label>
								<div class="col-sm-7"><input type="text" name="name" class="form-control" id="name"></div>
						</div>
						<div class="form-group">
									<label class=" col-sm-3" style="text-align: right;">身份：</label>
									<div class="col-sm-7">
										<div class="col-sm-1">
											<input type="radio" name="identity" value="1" aria-label="..."  checked="checked">
										</div>
										<div class="col-sm-3">游客</div>
										<div class="col-sm-1">
											<input type="radio" name="identity" value="0" aria-label="...">
										</div>
										<div class="col-sm-3">专家</div>
									</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="AddUser();">添加</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$(".list-group a").each(function() {
	         $(this).removeClass("active");
	 });
		$(".list-group a").eq(3).addClass("active");
	</script>
</body>
</html>
