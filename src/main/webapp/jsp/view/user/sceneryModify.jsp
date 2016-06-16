<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hand.entity.Scenery"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Scenery scenery=(Scenery)request.getAttribute("scenery");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改名胜古迹信息</title>
</head>

<body>
	<div class="container id1" style="width: 90%">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../layout/left_panel_user.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>修改名胜古迹信息</h4>
						<div style="float: right;margin-top: -35px;">
						 <input id="nameMdf" type="button" value="修改" class=" btn btn-danger" onclick="Modify('name')" />
						 <input id="nameConf" type="button" value="确认" class=" btn btn-success" onclick="Config('name')" style="display: none" />
						 <input id="nameCac" type="button" value="取消" class=" btn btn-warning" onclick="Cancel('name')" style="display: none" />
						</div>
					</div>
					<div class="panel-body">
						<form id="sceneryForm" action="<%=request.getContextPath()%>/PersonCenter/DoSceneryModify" method="post" enctype="multipart/form-data">
							<div>
								<label style="display: block;">概要：</label>
								<div class="form-group col-sm-12">
									<input type="text" value="<%=scenery.getSummary()%>" class="form-control " id="summary"  name="summary" disabled="disabled"/> 
								</div>
							</div>
							<div >
								<label for="exampleInputPassword1" style="display: block;">详情：</label>
								<div id="textDetail2">
									<%=scenery.getDetail()%>
								</div>
								<div class="content bgcolor-1" id="textDetail" style="display: none;">
								<div class="main">
									<div>
				  							<textarea id="editor1" name="editor" placeholder="Type your text here..." disabled="disabled">
				  							</textarea>
									</div>
									<input type="hidden" id="richText"  name="richText" value="<%=scenery.getDetail()%>"/>
									<input type="hidden" id="detailSub"  name="detailSub" />
									<input  type="hidden" name="sceneryId" value="<%=scenery.getId()%>" > 
								</div>
								
								</div>
								<div>
								<label style="display: block;">图片：</label>
								<div class="col-sm-12" style="margin-top: 5px;margin-bottom: 5px;">
									<input type="file" name="imgUpLoad" id="imgUpLoad" onchange="PreView()" class="filestyle" data-buttonName="btn-primary" disabled="disabled">
								</div>
								<div class="form-group col-sm-12">
									<img id="preview"  src="<%=request.getContextPath()%><%=scenery.getPicaddr()%>" onload="AutoResizeImage(650,0,this)" onerror="javascript:this.src='<%=request.getContextPath()%>/jsp/img/errorimg.jpg'" >
								</div>
								
							</div>
							</div>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var str = new Object();
		function Modify(inputId) {
			$("#sceneryForm input").each(function(){
				$(this).removeAttr("disabled");
			});
			
			var str=$("#textDetail2").html();
			$(".wysiwyg-editor").html(str);
			
			$("#textDetail").show();
			$("#textDetail2").hide();
			
			$("#" + inputId + "Mdf").hide();
			$("#" + inputId + "Conf").show();
			$("#" + inputId + "Cac").show();
		}
		function Cancel(inputId) {
			window.location.reload();
		}
		function Config(inputId) {
			var str=$(".wysiwyg-editor").html();
			$("#richText").val(str);
			
			var strNew=RegText(".wysiwyg-editor");
			var strFinal=SpiltStr(strNew);
			$("#detailSub").val(strFinal);
			$("#sceneryForm").submit();
		}
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
	
	</script>
<script type="text/javascript">
$(":file").filestyle({buttonName: "btn-primary"});
</script>
</body>
</html>