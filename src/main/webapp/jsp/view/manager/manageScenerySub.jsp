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
			
			<div class="col-md-9">
			<h2 style="display: inline-block;">名胜古迹管理</h2><div style="float:right;display: inline-block;margin-top: 20px;"><a  data-toggle="modal" data-target="#addSceneryModel" ata-whatever="@mdo" class="btn btn-info">添加</a></div>
				<hr align="left" width="100%" size="15" />
				
				<%for(int i=1;i<=numPage&&i<=len;i++){%>
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="media">
									<div class="media-left media-middle">
										<a href="#"> <img class="media-object " height="100px"
											width="100px" src="<%=request.getContextPath()%><%=sceneryList.get(i-1).getPicaddr()%>" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" alt="...">
										</a>
									</div>
									<div class="media-body">
										<h4 class="media-heading"><%=sceneryList.get(i-1).getSummary()%></h4>
										<%=sceneryList.get(i-1).getDetail()%>
									</div>
									<div class="col-lg-3 col-lg-offset-9">
										<a class="btn btn-warning" href="<%=request.getContextPath()%>/Manager/ModifyScenery?sceneryId=<%=sceneryList.get(i-1).getId()%>">修改</a>
										<a class="btn btn-danger" onclick="Delete('<%=sceneryList.get(i-1).getId()%>')" >删除</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
				<div class="modal-body" ">
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
		alert('+++++++++++++++++');
		$("#modelForm").submit();
	}
	
	
	function PrePage(){
		var urlStr="<%=request.getContextPath()%>/Manager/ManageScenerySub";	
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
		var urlStr="<%=request.getContextPath()%>/Manager/ManageScenerySub";	
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
		var urlStr="<%=request.getContextPath()%>/Manager/ManageScenerySub";	
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
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/wysiwyg.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/wysiwyg-editor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/textedit.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/js/bootstrap-filestyle.min.js"> </script>
<script type="text/javascript">
$(":file").filestyle({buttonName: "btn-primary"});
</script>
</body>
</html>