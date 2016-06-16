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

<title>风景名胜管理页面</title>
</head>

<body>
	<div class="container id1" style="width:95%">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../layout/left_panel_manager.jsp"></jsp:include>
			</div>
				<div class="col-md-10">
			<h4 style="display: inline-block;">名胜古迹管理</h4>
			<hr align="left" width="100%" size="15" />
			<div id="usrPanelContent">
			<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;" rowspan="1" width="15%">名胜古迹标题</th>
						<th style="text-align: center;" rowspan="1" width="25%">名胜古迹内容</th>
						<th style="text-align: center;" rowspan="1" width="15%">创建人</th>
						<th style="text-align: center;" rowspan="1" width="10%">创建时间</th>
						<th style="text-align: center;" rowspan="1" width="10%">审核状态</th>
						<th style="text-align:center;" rowspan="1" width="25%">操作</th>
					</tr>
				</thead>
				<tbody>
					<script type="text/javascript">
					GetManagerSceneryListOne();
					</script>
				</tbody>
				</table>
				</div>
		</div>
	</div>
</body>
</html>
