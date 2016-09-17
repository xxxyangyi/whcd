<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.Scenery"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Scenery scenery=(Scenery)request.getAttribute("scenery");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>风景名胜详细信息</title>
</head>

<body>
			<div class="col-md-10">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading" style="text-align: center;">
						<%=scenery.getSummary()%>
					</div>
					<div class="panel-body">
						<div class="col-lg-12">
							详情：
							<%=scenery.getDetail()%>
						</div>
						<div class="col-lg-12">
							<img style="width: 100%;height: 100%;" alt="" src="<%=request.getContextPath()%><%=scenery.getPicaddr()%>" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'">
						</div>
						
						<div class="col-lg-12">
							作者：<%=scenery.getUser_id().getName()%>
							<br/>
							创建日期：<date><fmt:formatDate value="<%=scenery.getCreateDate()%>" pattern="yyyy-MM-dd"/></date>
						</div>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
</body>
</html>
