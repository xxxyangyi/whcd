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

<title>注册页面</title>
<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="jsp/js/jquery-2.1.4.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
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
							<button class="btn btn-info" type="button" style="width: 150px">其他</button>
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
						<div class="col-lg-10 col-lg-offset-2">
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading">Middle aligned media</h4>
									这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片这是一张图片。。。
								</div>
								<div class="media-right media-middle">
									<a href="#"> <img class="media-object " height="100px"
										width="100px" src="jsp/image/sky.jpg" alt="...">
									</a>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>
