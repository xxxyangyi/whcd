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
	<%--<link rel="stylesheet" href="http://libs.useso.com/js/font-awesome/4.2.0/css/font-awesome.min.css">--%>
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap-datetimepicker.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/offcanvas.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>jsp/css/textedit_default.css">
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/wysiwyg-editor.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/textedit.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/prettify-1.0.css" />
	<link rel="stylesheet" type="text/css"  href="<%=basePath%>jsp/css/app.css">
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
	<script type="text/javascript" src="<%=basePath%>jsp/js/Chart.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/wysiwyg.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/app.js"></script>
	<script type="text/javascript" src="<%=basePath%>jsp/js/paging.js"></script>
	<style type="text/css">
	.footer{
	width: 90%;
	background:url('<%=basePath%>jsp/img/bg_footer.png');
	float: left;
	border-top: 5px solid #79c90e;
	height: 190px;
	padding-left: 40px;
	margin:15px auto 0;
}
.footer .footerDiv{
	display: inline-block;
	width: 120px;
	margin:20px;
	margin-top: 10px;
}
.footer .footerDiv .footerTitleBG1{
	background:url('<%=basePath%>jsp/img/foot_pic_01.gif');
}
.footer .footerDiv .footerTitleBG2{
	background:url('<%=basePath%>jsp/img/foot_pic_02.gif');
}
.footer .footerDiv .footerTitleBG3{
	background:url('<%=basePath%>jsp/img/foot_pic_03.gif');
}
.footer .footerDiv .footerTitleBG4{
	background:url('<%=basePath%>jsp/img/foot_pic_04.gif');
}
.footer .footerDiv span{
	font-size: 10px;
	color: #fff;
	margin-left: 30px;
}
.footer .footerDiv a{
	display: block;
	margin: 10px;
	font-size: 10px;
	color: #000;
	text-decoration: none;
}
.footer .footerLine{
	display: inline-block;
	border-right: 1px solid #000;
	height: 100px;
	margin-left: 0px;
}

.footer .footerNote{
	display: inline-block;
	font-size: 10px;
	color: #000;
	width: 350px;
	margin-top:30px;
	float: right;
}

	.side-bar {width: 66px;position: fixed;bottom: 20px;right: 25px;font-size: 0;line-height: 0;z-index: 100;}
										.side-bar a {width: 66px;height: 66px;display: inline-block;background-color: #ddd;margin-bottom: 2px;}
										.side-bar a:hover {background-color: #669fdd;}
										.side-bar .icon-qq {background-image: url(<%=basePath%>jsp/img/tencent_mobileqq_64px_1186944_easyicon.net.png);}
										.side-bar .icon-chat {background-image: url(<%=basePath%>jsp/img/tencent_mm_64px_1186943_easyicon.net.png);position: relative;}
										.side-bar .icon-chat:hover .chat-tips {display: block;}
										.side-bar .icon-blog {background-image: url(<%=basePath%>jsp/img/qq_qzone_64px_1186902_easyicon.net.png);}
										.side-bar .icon-mail {background-image: url(<%=basePath%>jsp/img/home_64px_1093601_easyicon.net.png)}
										.side-bar .icon-totop {background-position: 0 -334px;}
										.chat-tips {padding: 20px;border: 1px solid #d1d2d6;position: absolute;right: 78px;top: -55px;background-color: #fff;display: none;}
										.chat-tips i {width: 9px;height: 16px;display: inline-block;position: absolute;right: -9px;top: 80px;background-position:-88px -350px;}
										.chat-tips img {width: 138px;height: 138px;}
	</style>
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

<!--<footer class="footer">
	<div class="footerDiv">
		<div class="footerTitleBG1">
			<span>关于我们</span>
		</div>
		<a href="">关于本站</a> <a href="">法律声明</a> <a href="">招聘启事</a> <a
			href="">新手上门</a>
	</div>
	<div class="footerDiv">
		<div class="footerTitleBG2">
			<span>商务合作</span>
		</div>
		<a href="">市场合作</a> <a href="">友情链接</a> <a href="">商务合作</a> <a href="">携程合作</a>
	</div>
	<div class="footerDiv">
		<div class="footerTitleBG3">
			<span>联系我们</span>
		</div>
		<a href="">在线客服</a> <a href="">官方微博</a> <a href="">意见反馈</a> <a href="">QQ联系</a>
	</div>
	<div class="footerDiv">
		<div class="footerTitleBG4">
			<span>市场推广</span>
		</div>
		<a href="">携程旅行网</a> <a href="">艺龙旅行网</a> <a href="">途牛旅行网</a> <a href="">同城旅行网</a>
	</div>
	<div class="footerLine"></div>
	<div class=" footerNote">
		<p>
			©文化词典 <a href="file:///F:/LOLOWeb/index.html"><%=basePath%></a>
			文化词典小组所有
		</p>
		<p>滇ICP证:120807号 网络文化经营许可证:京网文[2015]0019-019号</p>
		<p>京公网安备：11010102000514号</p>
	</div>
</footer>-->
	
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
