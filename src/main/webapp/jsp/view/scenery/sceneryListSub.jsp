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
			
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />
				<%for(int i=1;i<=numPage&&i<=len;i++){%>
				<%if(i%2!=0){%>
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="panel panel-default">
							<div class="panel-body" style="height: 125px;">
								<div class="media">
									<div class="media-left media-middle">
										<a href="#"> <img class="media-object " style="margin-top: 20px;"  src="<%=request.getContextPath()%><%=sceneryList.get(i-1).getPicaddr()%>" onload="AutoResizeImage(100,100,this)" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'"  alt="...">
										</a>
									</div>
									<div class="media-body">
										<h4 class="media-heading"><a href="<%=request.getContextPath()%>/Scenery/SceneryDetail?sceneryId=<%=sceneryList.get(i-1).getId()%>"><%=sceneryList.get(i-1).getSummary()%></a></h4>
										<p style="width:470px;word-wrap:break-word;text-overflow:ellipsis"><%=sceneryList.get(i-1).getDetailSub()%></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%}else{ %>
				<div class="col-lg-10 col-lg-offset-2">
					<div class="panel panel-default">
						<div class="panel-body" style="height: 125px;">
							<div class="media">
								<div class="media-body">
									<h4 class="media-heading"><a href="<%=request.getContextPath()%>/Scenery/SceneryDetail?sceneryId=<%=sceneryList.get(i-1).getId()%>"><%=sceneryList.get(i-1).getSummary()%></a></h4>
									<p style="width:470px;word-wrap:break-word;text-overflow:ellipsis"><%=sceneryList.get(i-1).getDetailSub()%></p>
								</div>
								<div class="media-right media-middle">
									<a href="#"> <img class="media-object "  src="<%=request.getContextPath()%><%=sceneryList.get(i-1).getPicaddr()%>" onload="AutoResizeImage(100,100,this)" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" alt="...">
									</a>
								</div>
								<div class="col-lg-2 col-lg-offset-10">
										
									</div>
							</div>
						</div>
					</div>
				</div>
				<%} %>
				<%}%>
				
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
		var urlStr="<%=request.getContextPath()%>/Scenery/SceneryListSub";	
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
		var urlStr="<%=request.getContextPath()%>/Scenery/SceneryListSub";
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
		var urlStr="<%=request.getContextPath()%>/Scenery/SceneryListSub";
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
