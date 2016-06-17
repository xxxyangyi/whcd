<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User manager = (User)session.getAttribute("expert");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台系统首页</title>
</head>

<body>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />
					<div class="panel-body">
						<div style="height:200px;width: 200px;margin: 200px auto; "><h3>欢迎！<s:property value="#session.get('user').getName()"></s:property>登陆</h3></div>
					</div>
					
				</div>
</body>
</html>
