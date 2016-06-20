<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div id="sideMenuList" class="list-group">
		            <a href="<%=request.getContextPath()%>/Home/Index" class="list-group-item ">首页</a>
		            <a href="#" class="list-group-item active">投票系统</a>
		            <a  href="<%=request.getContextPath()%>/Scenery/SceneryList" class="list-group-item">名胜古迹</a>
 	</div>
	<script type="text/javascript">
					 getSideMenu();
	</script>