<%@page import="com.hand.entity.Scenery"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

	List<Scenery> sceneryList=(List<Scenery>)request.getAttribute("sceneryList");
	Integer total=(Integer)request.getAttribute("total");
	Integer num=(Integer)request.getAttribute("page");
	Integer numPage=(Integer)request.getAttribute("numPage");
	Integer len=sceneryList!=null?sceneryList.size():0;
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
			<div class="col-md-10">
				<div style="float:left;"><h4>名胜古迹列表</h4></div><a style="float:right;" class="btn btn-info" href="<%=request.getContextPath()%>/PersonCenter/CreateScenery">创建名胜古迹</a>
				<hr align="left" width="100%" size="15" />
				<table class="table table-hover" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">名胜古迹标题</th>
						<th style="text-align: center;">名胜古迹内容</th>
						<th style="text-align: center;">创建人</th>
						<th style="text-align: center;">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 1; i <= numPage && i <= len; i++) {
					%>
					<tr>
						<td><a href="<%=request.getContextPath()%>/PersonCenter/SceneryDetail?sceneryId=<%=sceneryList.get(i-1).getId()%>"><%=sceneryList.get(i-1).getSummary()%></a></td>
						<td><p style="width:400px;word-wrap:break-word;overflow:hidden; white-space:nowrap; text-overflow:ellipsis"><%=sceneryList.get(i-1).getDetailSub()%></p></td>
						<td><%=sceneryList.get(i-1).getUser_id().getName()%> </td>
						<td>
							<a class="btn btn-warning" href="<%=request.getContextPath()%>/PersonCenter/SceneryModify?sceneryId=<%=sceneryList.get(i-1).getId()%>">修改</a>
							<a class="btn btn-danger" onclick="Delete('<%=sceneryList.get(i-1).getId()%>')" >删除</a>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
				<hr align="left" width="100%" size="15" />
				<div class="col-lg-8 col-lg-offset-3">
					<div class="col-lg-2">
						<a onclick="PrePage()" class="btn btn-primary">上一页</a>
					</div>
					<div class="col-lg-3">
						<select id="selectPage" class="form-control" onchange="SelectedPage()">
						<%for(int i=1;i<=total;i++){%>
							<%if(i==num) {%>
							<option value="<%=i%>" selected="selected"><%=i%></option>
							<%}else{ %>
							<option value="<%=i%>"><%=i%></option>	
							<%} %>
						<%}%>
						</select>
					</div>
					<div class="col-lg-2">
						<a onclick="NextPage();" class="btn btn-primary">下一页</a>
					</div>
				</div>
			</div>
	<script type="text/javascript">
	function PrePage(){
		var urlStr="<%=request.getContextPath()%>/PersonCenter/SceneryManageSub";	
		var num=$("#selectPage").val();
		if(--num>0){
			var currentNum =num;
			//alert(currentNum);
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
		var urlStr="<%=request.getContextPath()%>/PersonCenter/SceneryManageSub";	
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
		var urlStr="<%=request.getContextPath()%>/PersonCenter/SceneryManageSub";
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
	
	function DeleteScenery(sceneryId){
		var urlStr="<%=request.getContextPath()%>/PersonCenter/DeleteScenery";
		$.ajax({
			url : urlStr,
			async : false,
			data:{"sceneryId":sceneryId},
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
	
	</script>
</body>