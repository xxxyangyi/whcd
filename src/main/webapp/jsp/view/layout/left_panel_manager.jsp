<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div class="list-group">
    <a href="<%=request.getContextPath()%>/Manager/Index" class="list-group-item " pageid="index" >首页</a>
    <a href="<%=request.getContextPath()%>/jsp/view/activityAdd.jsp" class="list-group-item " pageid="activityAdd">创建活动</a>
    <a href="<%=request.getContextPath()%>/activity/getActivitysOrderByCreateTime" class="list-group-item" pageid="manageActivity">活动管理</a>
    <a href="<%=request.getContextPath()%>/activity/managerVoteInfoReview?pageflag=1" class="list-group-item" pageid="manageVoteInfoReview">活动审核</a>
    <a href="<%=request.getContextPath()%>/Manager/ManageScenery" class="list-group-item">名胜古迹管理</a>
    <a href="<%=request.getContextPath()%>/Manager/ManageUser" class="list-group-item">用户管理</a>
    <a href="#" class="list-group-item">专家管理</a>
    <a href="<%=request.getContextPath()%>/Manager/ManageTab" class="list-group-item">菜单管理</a>
    <a href="<%=request.getContextPath()%>/Manager/ModifyInfo" class="list-group-item">个人信息修改</a>

</div>
