<%@page import="com.hand.entity.Scenery" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>风景名胜管理页面</title>
    <pageid name="manageScenery"></pageid>
</head>

<body>
<div class="col-md-10">
    <div class="panel panel-default">
        <div class="panel-heading">名胜古迹管理</div>
        <div class="panel-body" id="usrPanelContent">
            <table class="table table-hover" style="text-align: center;">
                <thead>
                <tr>
                    <th style="text-align: center;" rowspan="1" width="15%">名胜古迹标题</th>
                    <th style="text-align: center;" rowspan="1" width="25%">名胜古迹内容</th>
                    <th style="text-align: center;" rowspan="1" width="15%">创建人</th>
                    <th style="text-align: center;" rowspan="1" width="15%">创建时间</th>
                    <th style="text-align: center;" rowspan="1" width="10%">状态</th>
                    <th style="text-align: center;" rowspan="1" width="20%">操作</th>
                </tr>
                </thead>
                <tbody>
                <script type="text/javascript">
                    GetManagerSceneryListOne();
                </script>
                </tbody>
            </table>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>
</body>
</html>
