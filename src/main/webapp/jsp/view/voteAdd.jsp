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
</head>

<body>
	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="layout/left_panel.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">请填写您的投票信息</div>
					<div class="panel-body">
						<form  action="<%=basePath%>activity/voteAdd" method="post" enctype="multipart/form-data">
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
								<label style="display: block;">图片：</label>
								<div class="col-sm-12" style="margin-top: 5px;margin-bottom: 5px;">
									<input type="file" name="imgUpLoad" id="imgUpLoad" onchange="PreView()" class="filestyle" data-buttonName="btn-primary" >
								</div>
								<div class="form-group col-sm-12">
									<img id="preview" src="" onload="AutoResizeImage(650,0,this)"  onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" >
								</div>
								<br/>
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
</body>
</html>
