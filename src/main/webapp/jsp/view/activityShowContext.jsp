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

<title>活动内容</title>
<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="<%=basePath%>jsp/js/jquery-2.1.4.js"></script>
<script src="<%=basePath%>jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jsp/js/modernizr-2.6.2.min.js"></script>

<script type="text/javascript" src="jsp/js/app.js"></script>
</head>

<body>
	<jsp:include page="layout/nav_top.jsp"></jsp:include>

	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li>
						<div class="btn-group">
							<a href="<%=basePath%>activity/getActivityById?activity_id=<s:property value='activity.id'/>" class="btn btn-info" type="button" style="width: 150px">参加此活动</a>
						</div>
					</li>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" type="button" style="width: 150px">设置</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />
				<div class="row">
					<div id="activity_context"></div>
				</div>
				<div class="grid row">
					<s:iterator value="activity.vote" id='id' status='st'>
						<div class="grid_item col-sm-6 col-md-4" style="float:left">
							<div class="thumbnail">
								<img src="jsp/image/sky.jpg" alt="未知">
								<div class="caption">
									<h5 >
										<div ><s:property value="#id.user_id.name" /></div>
									</h5>
									<p>
										<s:property value="#id.context" />
									</p>
									<p >
										<s:property value="#id.voteNum" />票
										<button class="btn btn-primary btn-sm" onclick="vote(<s:property value='activity.id'/>,'<s:property value='#id.user_id.mail'/>',<s:property value='#id.id'/>)">投一票</button>
										<button class="btn btn-default btn-sm" >大图看详情</button>
									</p>
								</div>
							</div>
						</div>
					</s:iterator>
					<script type="text/javascript" src="<%=basePath%>jsp/js/jquery-2.1.4.js"></script>
					
					<script src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
					
					
					<script type="text/javascript">
					$(function(){  
						  $('.grid').masonry({  
						    // options  
						    itemSelector : '.grid_item',  
						    columnWidth : 0  
						  });  
						});
					</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
