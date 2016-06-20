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

<title>名胜古迹管理</title>
</head>

<body>
			<div class="col-md-9">
				<div style="float:left;"><h4>名胜古迹列表</h4></div><a style="float:right;" class="btn btn-info" href="<%=request.getContextPath()%>/PersonCenter/CreateScenery">创建名胜古迹</a>
				<hr align="left" width="100%" size="15" />
				<div id="usrPanelContent">
				<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">名胜古迹标题</th>
						<th style="text-align: center;">名胜古迹内容</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
				<script type="text/javascript">
					GetPersonCenterSceneryListOne();
				</script>
				</tbody>
				</table>
				</div>
			</div>
</body>