<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改个人信息</title>
</head>

<body>
			<div class="col-md-10">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">
						修改个人信息
						<div style="float: right;margin-top: -5px;">
						 <input id="nameMdf" type="button" value="修改" class=" btn btn-danger" onclick="Modify('name')" />
						 <input id="nameConf" type="button" value="确认" class=" btn btn-success" onclick="Config('name')" style="display: none" />
						 <input id="nameCac" type="button" value="取消" class=" btn btn-warning" onclick="Cancel('name')" style="display: none" />
						</div>
					</div>
					<div class="panel-body">
						<form id="resistForm" action="<%=request.getContextPath()%>/Manager/DoModifyInfo" method="post">
							<div>
								<label style="display: block;">用户名：</label>
								<div class="form-group col-sm-12">
									<input type="text" class="form-control " id="name"  name="name" value="<%=user.getName()%>" disabled="disabled"/> 
								</div>
							</div>
							<div>
								<label for="exampleInputPassword1" style="display: block;">密码：</label>
								<div class="form-group col-sm-12">
									<input type="password" id="password" class="form-control"  value="<%=user.getPassword()%>" name="password" disabled="disabled" /> 
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label>性别：</label>
									<div clas="row">

										<%
											if (user.getSex() == 1) {
										%>
										<div class="col-lg-1">
											<input type="radio" name="sex" value="1" aria-label="..."
												checked="checked">
										</div>
										<div class="col-lg-3">男</div>
										<div class="col-lg-1">
											<input type="radio" name="sex" value="0" aria-label="...">
										</div>
										<div class="col-lg-3">女</div>
										<%
											} else {
										%>
										<div class="col-lg-1">
											<input type="radio" name="sex" value="1" aria-label="...">
										</div>
										<div class="col-lg-3">男</div>
										<div class="col-lg-1">
											<input type="radio" name="sex" value="0" aria-label="..."
												checked="checked">
										</div>
										<div class="col-lg-3">女</div>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
	<script type="text/javascript">
		var str = new Object();
		function Modify(inputId) {
			$("#resistForm input").each(function(){
				$(this).removeAttr("disabled");
			});
			$("#" + inputId + "Mdf").hide();
			$("#" + inputId + "Conf").show();
			$("#" + inputId + "Cac").show();
		}
		function Cancel(inputId) {
			window.location.reload();
		}
		function Config(inputId) {
			$("#resistForm").submit()
		}
		function Reset() {
			window.location.reload();
		}
		$(".list-group a").each(function() {
	         $(this).removeClass("active");
	 });
		$(".list-group a").eq(5).addClass("active");
	</script>
</body>
</html>
