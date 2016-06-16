<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	User user = (User) session.getAttribute("user");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>创建名胜古迹</title>
</head>

<body>
	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../layout/left_panel_user.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">
						创建名胜古迹
						<div style="float: right;margin-top: -5px;">
						 <input id="nameMdf" type="button" value="创建" class=" btn btn-danger" onclick="Create()" />
						</div>
					</div>
					<div class="panel-body">
						<form id="sceneryForm" action="<%=request.getContextPath()%>/PersonCenter/DoCreateScenery" method="post" enctype="multipart/form-data">
							<div>
								<label style="display: block;">概要：</label>
								<div class="form-group col-sm-12">
									<input type="text" class="form-control " id="summary"  name="summary"/> 
								</div>
							</div>
							<div>
								<label for="exampleInputPassword1" style="display: block;">详情：</label>
								<div class="content bgcolor-1">
								<div class="main">
									<div>
				  							<textarea id="editor1" name="editor" placeholder="Type your text here...">
				  							</textarea>
									</div>
									<input type="hidden" id="richText"  name="richText" /> 
									<input type="hidden" id="detailSub"  name="detailSub" />
								</div>
								</div>
							</div>
							<div>
								<label style="display: block;">图片：</label>
								<div class="col-sm-12" style="margin-top: 5px;margin-bottom: 5px;">
									<input type="file" name="imgUpLoad" id="imgUpLoad" onchange="PreView()" class="filestyle" data-buttonName="btn-primary" >
								</div>
								<div class="form-group col-sm-12">
									<img id="preview" src="" onload="AutoResizeImage(650,0,this)"  onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" >
								</div>
								<br/>
						</div>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</body>