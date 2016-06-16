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
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<h4 style="float: left;">文化词典后台管理系统</h4>
		<a style="float: right;cursor: pointer;color: #000;text-decoration:none;" onclick="logout('<%=path%>/Home/DoLogOut');"><h4>退出</h4></a>
	</div>
	<!-- /.container-fluid --> </nav>
	<script type="text/javascript">
		function login(url) {
			var mail=$("#mailLogin").val();
			var password=$("#passwordLogin").val();
			$.ajax({
				url : url,
				async : false,
				data:{"mail":mail,"password":password},
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status==='1'){
						window.location.reload();
					}
					else{
						$("#error").html("邮箱或密码输入有误！");
					}
						
				}
			});
		}
		function logout(url){
			
			$.ajax({
				url : url,
				async : false,
				error : function() {
					alert("登陆过程出错！");
				},
				success : function(data) {
					var status=data;
					if(status==='1'){
						alert("退出成功!");
						window.location.reload();
					}
					else{
						alert("退出失败!");
					}
						
				}
			});
		}
		
	</script>
</body>
