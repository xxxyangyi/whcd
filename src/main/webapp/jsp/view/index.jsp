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
<title>注册页面</title>
</head>
<body>
	<div class="col-md-8">
		<h3>最新更新风景人文</h3>
		<div id="home_scenery_list"></div>
		<div id="sceneryHomePage"></div>
		<script type="text/javascript">
					getSceneryDataHomePage();
				</script>
	</div>
	<div class="col-md-4">
		<h3>最新更新活动</h3>
		<div id="home_activity_list"></div>
	</div>
</body>
</html>