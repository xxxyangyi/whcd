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
<div class="col-md-10" style="background-color: white;">
	<h2 style="display: inline-block;">用户管理</h2><div style="float:right;display: inline-block;margin-top: 20px;"><a  data-toggle="modal" data-target="#addUserModel" ata-whatever="@mdo" class="btn btn-info">添加</a></div>
	<table class="table table-hover" style="text-align:center;">
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
				<td><a href="<%=request.getContextPath()%>/Manager/DetailUserInfo?mail=<%=userList.get(i-1).getMail()%>"><%=userList.get(i-1).getMail()%></a></td>
				<td><%=userList.get(i-1).getName()%></td>
				<td>
					<a class="btn btn-warning" onclick="InitializeUserPassword('<%=userList.get(i-1).getMail()%>')">初始化密码</a>
					<%if(userList.get(i-1).getIsUsed()==1) {%>
					<a class="btn btn-danger" onclick="Disable('<%=userList.get(i-1).getMail()%>')" >禁用</a>
					<%}else{ %>
					<a class="btn btn-success" onclick="Able('<%=userList.get(i-1).getMail()%>')" >解禁</a>
					<%} %>
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
</script>
</body>
</html>
