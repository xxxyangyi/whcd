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

<title>管理活动</title>
</head>

<body>
	<div class="col-md-9">
		<div class="panel panel-default">
			<div class="panel-heading">活动列表
			<a  href="<%=basePath%>jsp/view/activityAdd.jsp" class="btn btn-default" style="float:right">创建一个新的活动</a>
			</div>
			<div class="panel-body">
				<table class="table table-hover table-condensed">
					<tr>
						<th style="text-align: left;" rowspan="1" width="15%">活动名称</th>
						<th style="text-align: left;" rowspan="1" width="10%">创建时间</th>
						<th style="text-align: left;" rowspan="1" width="10%">开始时间</th>
						<th style="text-align: left;" rowspan="1" width="10%">结束时间</th>						
						<th style="text-align: left;" rowspan="1" width="55%">活动内容</th>
					</tr>
					<s:iterator value="activityList" id='id' status='st'>
						
						<tr>							
							<td style="text-align: left"><a href="<%=basePath%>activity/manageActivityForm?activity_id=<s:property value='#id.id'/>"><s:property value="#id.activityName"/></a></td>
							<td style="text-align: left"><s:property value="#id.createTime"/></td>
							<td style="text-align: left"><s:property value="#id.startTime"/></td>
							<td style="text-align: left"><s:property value="#id.endTime"/></td>
							<td style="text-align: left"><s:property value="#id.context"/></td>						
						</tr>
						
					</s:iterator>



				</table>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</body>
</body>
</html>