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

<title>用户管理</title>
</head>

<body>
	<jsp:include page="../layout/nav_top_manager.jsp"></jsp:include>

	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../layout/left_panel_manager.jsp"></jsp:include>
			</div>
			
			<div id="usrPanelContent">
				<jsp:include page="manageUserSub.jsp"></jsp:include>
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
