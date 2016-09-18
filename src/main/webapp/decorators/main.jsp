<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<html>
<head>
<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/bootstrap-datetimepicker.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/offcanvas.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>jsp/css/cssFramework/textedit_default.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/wysiwyg-editor.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/textedit.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/cssFramework/prettify-1.0.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/app.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/table.css">
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/moment-with-locales.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/bootstrap-filestyle.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/textedit.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/wysiwyg-editor.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/Chart.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/wysiwyg.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/app.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/paging.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/menuActive.js"></script>
	<decorator:head/>
	
</head>
<body>
	<s:if test="#session.get('user')!=null">
		<s:if test="#session.get('user').getIdentity()==0">
			<jsp:include page="/jsp/view/layout/nav_top_manager.jsp"></jsp:include>
		</s:if>
		<s:elseif test="#session.get('user').getIdentity()==2">
			<jsp:include page="/jsp/view/layout/nav_top_expert.jsp"></jsp:include>
		</s:elseif>
		<s:else>
			<jsp:include page="/jsp/view/layout/nav_top.jsp"></jsp:include>
		</s:else>
	</s:if>
	<s:else>
		<jsp:include page="/jsp/view/layout/nav_top.jsp"></jsp:include>
	</s:else>
	<div class="container id1" style="width: 99%">
		<div class="row">
			<div id="mainLeftPanel" class="col-md-2">
				<s:if test="#session.get('user')!=null">
					<s:if test="#session.get('user').getIdentity()==0">
						<jsp:include page="/jsp/view/layout/left_panel_manager.jsp"></jsp:include>
					</s:if>
					<s:elseif test="#session.get('user').getIdentity()==2">
						<jsp:include page="/jsp/view/layout/left_panel_expert.jsp"></jsp:include>
					</s:elseif>
					<s:else>
						<jsp:include page="/jsp/view/layout/left_panel_user.jsp"></jsp:include>
					</s:else>
				</s:if>
			</div>
			<decorator:body />  
		</div>
	</div>
	
	<script type="text/javascript">
		var url_perfix = "http://localhost:8080/";
		if(window.location.href==url_perfix){
			$('#mainLeftPanel').remove()
		}
		if(window.location.href==(url_perfix+"#")){
			$('#mainLeftPanel').remove()
		}		
		if(window.location.href==url_perfix+"Home/Index"){
			$('#mainLeftPanel').remove()
		}
	</script>
</body>
</html>
