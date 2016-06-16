<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
	<link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap-datetimepicker.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/offcanvas.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>jsp/css/textedit_default.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/wysiwyg-editor.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/textedit.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/prettify-1.0.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/app.css">
	<script type="text/javascript" src="<%=basePath%>jsp/js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/jquery-2.1.4.min.js"></script>	
	<script type="text/javascript" src="<%=basePath%>jsp/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/moment-with-locales.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/bootstrap-filestyle.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/textedit.js"></script>	
	<script type="text/javascript" src="<%=basePath%>jsp/js/wysiwyg-editor.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/wysiwyg.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/app.js"></script>
	<sitemesh:write property='head' />
</head>
<body>
	<jsp:include page="/jsp/view/layout/nav_top_manager.jsp"></jsp:include>
	<sitemesh:write property='body' />
</body>
</html>