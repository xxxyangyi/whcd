<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User manager = (User) session.getAttribute("manager");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台系统首页</title>
</head>

<body>
	<div class="container id1" style="width: 95%">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../layout/left_panel_manager.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<hr align="left" width="100%" size="15" />
				<div class="panel-body">
					<div style="height: 200px; width: 200px; margin: 200px auto;">
						<h3>欢迎!登陆</h3>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
