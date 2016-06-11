<%@page import="com.hand.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	List<User> userList=(List<User>)request.getAttribute("userList");
	Integer total=(Integer)request.getAttribute("total");
	Integer num=(Integer)request.getAttribute("page");
	Integer numPage=(Integer)request.getAttribute("numPage");
	Integer len=userList!=null?userList.size():0;
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-md-9" style="background-color: white;">
	<h2 style="display: inline-block;">用户管理</h2><div style="float:right;display: inline-block;margin-top: 20px;"><a  data-toggle="modal" data-target="#addUserModel" ata-whatever="@mdo" class="btn btn-info">添加</a></div>
	<table class="table table-bordered" style="text-align:center;">
		<thead >
			<tr>
				<th style="text-align:center;">邮箱</th>
				<th style="text-align:center;">用户名</th>
				<th style="text-align:center;">操作</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=1;i<=numPage&&i<=len;i++){
			%>
			<tr>
				<td><%=userList.get(i-1).getMail()%></th>
				<td><%=userList.get(i-1).getName()%></td>
				<td>
					<a class="btn btn-warning" href="<%=request.getContextPath()%>/Manager/ModifyUserInfo?mail=<%=userList.get(i-1).getMail()%>">修改</a>
					<a class="btn btn-danger" onclick="Delete('<%=userList.get(i-1).getMail()%>')" >删除</a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<hr align="left" width="100%" size="15"  />
	<div class="col-lg-8 col-lg-offset-3" style="margin-bottom: 5px">
		<div class="col-lg-2">
			<a onclick="PrePage()" class="btn btn-primary">上一页</a>
		</div>
		<div class="col-lg-3">
			<select id="selectPage" class="form-control"
				onchange="SelectedPage()">
				<%
					for(int i=1;i<=total;i++){
				%>
				<%
					if(i==num) {
				%>
				<option value="<%=i%>" selected="selected"><%=i%></option>
				<%
					}else{
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>
				<%
					}
				%>
			</select>
		</div>
		<div class="col-lg-2">
			<a onclick="NextPage();" class="btn btn-primary">下一页</a>
		</div>
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
					<h4 class="modal-title" id="exampleModalLabel">添加新用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group  ">
							<label id="error" style="color: red;text-align: center;" class="control-label col-sm-10"></label>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">邮箱：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="mail" />
							</div>
						</div>
						<div class="form-group  ">
							<label class="control-label col-sm-3">密码：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="password" />
							</div>
						</div>
						<div class="form-group">
								
									<label class=" col-sm-3" style="text-align: right;">性别：</label>
									<div class="col-sm-7">
										<div class="col-sm-1">
											<input type="radio" name="sex" value="1" aria-label="..." checked="checked">
										</div>
										<div class="col-sm-1">男</div>
										<div class="col-sm-1">
											<input type="radio" name="sex" value="0" aria-label="...">
										</div>
										<div class="col-sm-1">女</div>
									</div>
								
						</div>
						<div class="form-group">
								<label class="control-label col-sm-3">用户名：</label>
								<div class="col-sm-7"><input type="text" name="name" class="form-control" id="name"></div>
						</div>
						<div class="form-group">
									<label class=" col-sm-3" style="text-align: right;">身份：</label>
									<div class="col-sm-7">
										<div class="col-sm-1">
											<input type="radio" name="identity" value="1" aria-label="..."  checked="checked">
										</div>
										<div class="col-sm-3">游客</div>
										<div class="col-sm-1">
											<input type="radio" name="identity" value="0" aria-label="...">
										</div>
										<div class="col-sm-3">专家</div>
									</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="Add();">添加</button>

				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function PrePage(){
		var urlStr="<%=request.getContextPath()%>/Manager/ManageUserSub";	
		var num=$("#selectPage").val();
		if(--num>0){
			var currentNum =num;
			$.ajax({
				url : urlStr,
				async : false,
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					$("#usrPanelContent").html(data);
				}
			});
		}
	}
	
	function NextPage(){
		var urlStr="<%=request.getContextPath()%>/Manager/ManageUserSub";	
		var num=$("#selectPage").val();
		if(++num<=<%=total%>){
			var currentNum =num;
			$.ajax({
				url : urlStr,
				async : false,
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					$("#usrPanelContent").html(data);
				}
			});
		}
		
	}
	
	function SelectedPage() {
		var urlStr="<%=request.getContextPath()%>/Manager/ManageUserSub";	
		var currentNum = $("#selectPage").val();
			$.ajax({
				url : urlStr,
				async : false,
				data:{"page":currentNum},
				error : function() {
					alert("ajax出错！");
				},
				success : function(data) {
					$("#usrPanelContent").html(data);
				}
			});
		}
	function Delete(mail){
		var urlStr="<%=request.getContextPath()%>/Manager/DeleteUser";	
		$.ajax({
			url : urlStr,
			async : false,
			data : {
				"mail" : mail
			},
			error : function() {
				alert("删除失败！");
			},
			success : function(data) {
				if(data==='1')
					alert('删除成功');
			else
				alert('删除成功');
			window.location.reload();
			}
		});
	}
	function Add(){
		var urlStr='<%=request.getContextPath()%>/Manager/AddUser';
		var mail=$("#mail").val();
		alert(mail);
		var password=$("#password").val();
		var identity=$("input[name='identity']").val();
		var sex=$("input[name='sex']").val();
		var name=$("#name").val();
		
		$('#addUserModel').modal('hide')
		$.ajax({
			url : urlStr,
			async : false,
			data : {
				"mail" : mail,
				"name":name,
				"sex":sex,
				"identity":identity,
				"password":password
			},
			error : function() {
				alert("添加失败！");
			},
			success : function(data) {
				if(data==='1')
					alert('添加成功！');
				else
					alert('添加失败！');
			window.location.reload();
			}
		});
		
	}
</script>
</body>
</html>
