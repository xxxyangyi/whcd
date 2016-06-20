、<%@page import="com.hand.entity.Scenery"%>
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

<title>首页</title>
</head>

<body>

	<div class="col-md-9" style="background-color: white;">
	<h2 style="display: inline-block;">菜单管理</h2><div style="float:right;display: inline-block;margin-top: 20px;"><a  data-toggle="modal" data-target="#addUserModel" ata-whatever="@mdo" class="btn btn-info">添加</a></div>
	<div id="usrPanelContent">
	<table class="table table-hover" style="text-align:center;">
		<thead >
			<tr>
				<th style="text-align:center;">菜单名称</th>
				<th style="text-align:center;">菜单位置</th>
				<th style="text-align:center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<script type="text/javascript">
				GetTabListOne();
			</script>
		</tbody>
		
		</table>
		</div>
		</div>
	<div class="modal fade" id="addUserModel" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加新菜单</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group  ">
							<label id="error" style="color: red;text-align: center;" class="control-label col-sm-10"></label>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">菜单名称：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" />
							</div>
						</div>
						<div class="form-group">
									<label class=" col-sm-3" style="text-align: right;">位置：</label>
									<div class="col-sm-7">
										<div class="col-sm-1">
											<input type="radio" name="position" value="0" aria-label="..."  checked="checked">
										</div>
										<div class="col-sm-3">顶部</div>
										<div class="col-sm-1">
											<input type="radio" name="position" value="1" aria-label="...">
										</div>
										<div class="col-sm-3">侧栏</div>
									</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="AddTab();">添加</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		$(".list-group a").each(function() {
	         $(this).removeClass("active");
	 });
		$(".list-group a").eq(3).addClass("active");
	</script>
</body>
</html>