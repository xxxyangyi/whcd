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
<title>活动清单</title>
</head>

<body>
	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<!--<jsp:include page="layout/left_panel.jsp"></jsp:include>-->
			</div>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />
				<div class="row">
				<div id="activity_list"></div>					
				</div>
			</div>
		</div>
	</div>
</body>
</body>
</html>