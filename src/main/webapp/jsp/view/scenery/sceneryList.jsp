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
<title>首页</title>
</head>
<body>
			<div id="scennery" class="col-md-10">
				<hr align="left" width="100%" size="15" />
				<div id="usrPanelContent">
					<script type="text/javascript">
						GetSceneryListOne(<%=request.getParameter("tabid")%>);
					</script>
				</div>
			</div>
</body>
</body>
</html>
