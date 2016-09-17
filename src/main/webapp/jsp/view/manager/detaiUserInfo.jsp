<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) request.getAttribute("user");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户详细信息</title>
</head>

<body>
			<div class="col-md-10">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">
						个人信息
						</div>
					</div>
					<div class="panel-body">
						<div >
							<input type="hidden" value="<%=user.getMail()%>" name="mail" />
							<div>
								<label style="display: block;">邮箱：</label>
								<div class="form-group col-sm-12">
									<%=user.getMail()%>
								</div>
							</div>
							<div>
								<label style="display: block;">用户名：</label>
								<div class="form-group col-sm-12">
									<%=user.getName()%>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label>性别：</label>
									<div clas="row">

										<%
											if (user.getSex() == 1) {
										%>
										<div class="col-lg-3">男</div>
										<%
											} else {
										%>
										<div class="col-lg-3">女</div>
										<%
											}
										%>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<label>等级：</label>
									<div clas="row">

										<%
											if (user.getIdentity() == 1) {
										%>
										<div class="col-lg-3">普通用户</div>
										<%
											} else {
										%>
										<div class="col-lg-3">专家</div>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer"></div>
				</div>
</body>
</html>
