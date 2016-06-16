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
	<div class="container id1" style="width: 90%">
		<div class="row">
			<hr align="left" width="100%" size="15" />	
			<div class="col-md-8">
				<div id="home_scenery_list"> </div>
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="media">
									<div class="media-left media-middle">
										<a href="#"> <img class="media-object " height="100px"
											width="100px" src="jsp/image/sky.jpg" alt="...">
										</a>
									</div>
									<div class="media-body">
										<h4 class="media-heading">Middle aligned media</h4>
										这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片。。。
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="col-md-4">
				<div id="home_activity_list"> </div>
			</div>
		</div>
	</div>
</body>
</html>