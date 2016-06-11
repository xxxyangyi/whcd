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

<title>创建投票信息</title>
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

				<div class="panel panel-default">
					<div class="panel-heading">请填写您的投票信息</div>
					<div class="panel-body">
						<form  action="<%=basePath%>activity/voteAdd" method="post">
							<div class="form-group">
								<label for="dropdownActivity">您所要参加的活动：</label>
								<div class="dropdown">
									<select name="activity_id" class="btn btn-default dropdown-toggle form-control"
										id="selectActivity" >
										<option value=<s:property value="activity.id"/> selected="selected"><s:property value="activity.id"/></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="inputFile">请上传您要参加评选的图片：</label>
								<div>
									<img src="jsp/image/sky.jpg" class="img-thumbnail">
								</div>
								<input type="file" id="inputFile">
								<!-- <p class="help-block">加油加油加油！！！</p> -->
							</div>
							<div class="form-group">
								<label for="context">请简介照片内容</label>
								<textarea name="vote.context" style="height: 100px" class="form-control"
									id="context" placeholder="请简介照片内容"></textarea>
							</div>
							<button type="submit" class="btn btn-default">提交</button>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>






			</div>
		</div>
	</div>
</body>
</html>
