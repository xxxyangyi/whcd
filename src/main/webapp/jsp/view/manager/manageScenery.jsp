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
                <tbody id="sceneryListPaging"></tbody>
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-2 col-md-offset-2" id="per"></div>
                <div class="col-md-2 col-md-offset-2" id="pageNo"></div>
                <div class="col-md-2 col-md-offset-1" id="next"></div>
            </div>
        </div>
        <div class="panel-footer"></div>
        <table hidden="hiddenr">
            <tbody id="sceneryListPaging_Model">
            <tr class="sceneryListPaging_Tr" id="@@@id@">
                <td>
                    <a href="http://localhost:8080/PersonCenter/SceneryDetail?sceneryId=@@@id@">@@@summary@</a>
                </td>
                <td>
                    @@@detailSub@
                </td>
                <td>@@@user_id.name@</td>
                <td>@@@createDate@</td>
                <td class="isAudited">@@@isAudited@</td>
                <td><a class="btn btn-xs btn-danger dele" style="margin-left:5px;float:left"
                       onclick="scenery.deleteScenery('@@@id@')">删除</a>
                    <a class="btn btn-xs btn-warning pass" style="margin-left:5px;float:left"
                       onclick="scenery.auditScenery('@@@id@')">通过</a>
                    <a class="btn btn-xs btn-warning noPass" style="margin-left:5px;float:left"
                       onclick="scenery.disAuditScenery('@@@id@')">不通过</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    pagingStart2('#sceneryListPaging', '#sceneryListPaging_Model','#per','#next','#pageNo', '/scenery/getSceneryList','scenery.isAuditedToString()')
</script>
</body>
</html>
