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
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<h4 style="float: left;">欢迎<s:property value="#session.get('user').getName()"></s:property> 专家</h4>
		<a style="float: right;cursor: pointer;color: #000;text-decoration:none;" onclick="logout('<%=path%>/Home/DoLogOut');"><h4>退出</h4></a>
	</div>
	<!-- /.container-fluid --> </nav>

</body>
