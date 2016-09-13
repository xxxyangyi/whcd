<%@page import="com.hand.entity.Scenery"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

	List<Scenery> sceneryList=(List<Scenery>)request.getAttribute("sceneryList");
	Integer total=(Integer)request.getAttribute("total");
	Integer num=(Integer)request.getAttribute("page");
	Integer numPage=(Integer)request.getAttribute("numPage");
	Integer len=sceneryList!=null?sceneryList.size():0;
%>
<link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jsp/css/textedit_default.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jsp/css/wysiwyg-editor.css" />
<link href="<%=request.getContextPath()%>/jsp/css/textedit.css" rel="stylesheet" type="text/css" />
<%@ taglib prefix="s" uri="/struts-tags"%>
			
			<div class="col-md-10">
			<h4 style="display: inline-block;">名胜古迹管理</h4>
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
						<td><a href="<%=request.getContextPath()%>/Manager/DetailSceneryInfo?sceneryId=<%=sceneryList.get(i-1).getId()%>"><%=sceneryList.get(i-1).getSummary()%></a></td>
						<td><p style="width:400px;word-wrap:break-word;overflow: hidden;white-space: nowrap;;text-overflow:ellipsis"><%=sceneryList.get(i-1).getDetailSub()%></p></td>
						<td><%=sceneryList.get(i-1).getUser_id().getName()%> </td>
						<td><a class="btn btn-danger" onclick="Delete('<%=sceneryList.get(i-1).getId()%>')">删除</a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
				<hr align="left" width="100%" size="15" />
				<div class="col-lg-8 col-lg-offset-3">
					<div class="col-lg-2">
						<a onclick="PrePage('<%=request.getContextPath()%>/Manager/ManageScenerySub')" class="btn btn-primary">上一页</a>
					</div>
					<div class="col-lg-3">
						<select id="selectPage" class="form-control"
								onchange="SelectedPage('<%=request.getContextPath()%>/Manager/ManageScenerySub')">
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
						<a onclick="NextPage('<%=request.getContextPath()%>/Manager/ManageScenerySub','<%=total%>');" class="btn btn-primary">下一页</a>
					</div>
				</div>
			
				</div>
			
			
<div class="modal " id="addSceneryModel" tabindex="-1" role="dialog"
		aria-labelledby="addSceneryModel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width: 850px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">添加名胜古迹</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="modelForm" action="<%=request.getContextPath()%>/Manager/AddScenery" method="post" enctype="multipart/form-data" >
						
						<div class="form-group  ">
							<label class="control-label col-sm-2" style="text-align: left" >概要：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="summary" name="summary"
									aria-describedby="mailStatus">
							</div>
						</div>
						<div class="form-group" style="z-index: 99999999999;">
								<label for="exampleInputPassword1" style="display: block;margin-left: 15px">详情：</label>
								<div class="content bgcolor-1">
								<div class="main">
									<div style="width:100%">
				  							<textarea id="editor1" name="editor" placeholder="Type your text here...">
				  							</textarea>
									</div>
									<input type="hidden" id="richText"  name="richText" /> 
									<input type="hidden" id="detailSub"  name="detailSub" />
								</div>
								</div>
						</div>
						<div class="form-group">
								<label style="display: block;margin-left:15px">图片：</label>
								<div class="form-group col-sm-12">
									<img id="preview" src="" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" style="width: 100%;height: 100%;" >
								</div>
								<br/>
								<div class="col-sm-12" style="margin-bottom: 10px;">
									<input type="file" name="imgUpLoad" id="imgUpLoad" onchange="PreView()" class="filestyle" data-buttonName="btn-primary" >
								</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" style="text-align: left;">用户ID：</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="userId" name="userId" aria-describedby="mailStatus">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer" style="margin-top: 5px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					
					<input type="button" class="btn btn-primary" onclick="Create()" value="添加" />
				</div>
			</div>
		</div>
</div>	
			
	<script type="text/javascript">
	function GetFilePath() {
		var addr = null;
		var docObj = document.getElementById("imgUpLoad");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL
					.createObjectURL(docObj.files[0]);
			addr = imgObjPreview.src;
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				addr = imgSrc;
				//alert(imgSrc);
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return addr;
	}

	function PreView() {
		var addr = GetFilePath();
		$("#preview").attr("src", addr);
	}
	
	function Create(){
		var str=$(".wysiwyg-editor").html();
		$("#richText").val(str);
		var strNew=RegText(".wysiwyg-editor");
		var strFinal=SpiltStr(strNew);
		$("#detailSub").val(strFinal);
		
		$("#modelForm").submit();
	}
	
	function Delete(sceneryId){
		var urlStr="<%=request.getContextPath()%>/Manager/DeleteScenery";	
		$.ajax({
			url : urlStr,
			async : false,
			data:{"sceneryId":sceneryId},
			error : function() {
				alert("删除失败！");
			},
			success : function(data) {
				//$("#usrPanelContent").html(data);
				if(data==='1')
						alert('删除成功');
				else
					alert('删除成功');
				window.location.reload();
			}
		});
	}
	
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/JsFramework/wysiwyg.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/JsFramework/wysiwyg-editor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/JsFramework/textedit.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/JsFramework/bootstrap-filestyle.min.js"> </script>
<script type="text/javascript">
$(":file").filestyle({buttonName: "btn-primary"});
</script>
</body>
</html>
