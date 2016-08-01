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
								<label style="display: block;">标题：</label>
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
								<label for="exampleInputPassword1" style="display: block;">类别：</label>
								<select id="tab" name="tab" class="form-control">
										
								</select>
								<script type="text/javascript">
									GetTabData();
								</script>
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
		//alert(str);
		$("#richText").val(str);
		var strNew=RegText(".wysiwyg-editor");
		var strFinal=SpiltStr(strNew);
		$("#detailSub").val(strFinal);
		$("#sceneryForm").submit();
	}
	</script>
<script type="text/javascript">
$(":file").filestyle({buttonName: "btn-primary"});
</script>
</body>
</body>
