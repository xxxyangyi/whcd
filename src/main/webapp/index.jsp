<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'customer.jsp' starting page</title>

<link rel="stylesheet" href="jsp/css/bootstrap.css">
<link rel="stylesheet" href="jsp/css/app.css">
<script src="jsp/js/jquery-2.1.4.min.js"></script>
<script src="jsp/js/bootstrap.min.js"></script>
<script src="jsp/js/app.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
	/*background-color:#ffffff ;*/
}
</style>

</head>

<body>
	<nav class="navbar navbar-default f" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">杨毅8376</a>
		</div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Admin</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container id1" style="width:90%">
		<div class="row">
			<div class="col-lg-2">
				<ul>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" id="cus_btn" type="button"
								style="width: 150px">Customer管理</button>
						</div>
					</li>
					<li>
						<div class="btn-group">
							<button class="btn btn-info" id="test" type="button"
								style="width: 150px">Film设置</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-10">
				<div class="row">
					<h1>客户管理</h1>
				</div>
				<div class="row">
					<div class="form-group form-group-sm" style="width: 200px">
						<span>客户列表</span>
						<button class="btn btn-default btn-sm" id="addCus">新建</button>
					</div>

				</div>

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>操作</th>
							<th>First name</th>
							<th>List name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Customer id</th>
							<th>Last update</th>
						</tr>
					</thead>
					<tbody id="addinfo">

					</tbody>

				</table>

				<div class="btn-group" style="float:right">
					<button class="btn btn-info" id="page_btn_old" type="button">上一页</button>
					<button class="btn btn-info" id="page_btn1" type="button">1</button>
					<button class="btn btn-info" id="page_btn2" type="button">2</button>
					<button class="btn btn-info" id="page_btn3" type="button">3</button>
					<button class="btn btn-info" id="page_btn_new" type="button">下一页</button>

				</div>
			</div>

		</div>
	</div>
	<!-- ----------------------------弹出来的页面------------------------------------------- -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">更新信息</h4>
				</div>
				<div class="modal-body">
					<div class="input-group"
						style="margin-left: 15%;margin-right: auto">
						<div class="row">
							<div class="col-lg-2">
								<span class="input-group-addon">First Name:</span>
							</div>
							<div class="col-lg-6">
								<input type="text" id="first_name" class="form-control col-lg-6"
									placeholder="First Name">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-2">
								<span class="input-group-addon">Last Name:</span>
							</div>
							<div class="col-lg-6">
								<input type="text" id="last_name" class="form-control col-lg-6"
									placeholder="Last Name">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-2">
								<span class="input-group-addon">Email:</span>
							</div>
							<div class="col-lg-6">
								<input type="text" id="email" class="form-control col-lg-6"
									placeholder="Email">
							</div>
						</div>
						<div class="row">
							<div class="col-lg-2">
								<span class="input-group-addon">Address:</span>
							</div>
							<div class="col-lg-6">
								<input type="text" id="address" class="form-control col-lg-6"
									placeholder="Address">
							</div>
							<input type="hidden" id="hidden" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button"  class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="sub_edit_info" class="btn btn-primary">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		
	</div>

</body>
</html>
