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
    <title>管理活动</title>
    <pageid name="manageActivity"></pageid>
</head>

<body>
<div class="col-md-10">
    <div class="panel panel-default">
        <div class="panel-heading">活动列表
            <a href="<%=basePath%>jsp/view/activityAdd.jsp" class="btn btn-default" style="float:right;padding: 2px 12px;">创建一个新的活动</a>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-condensed">
                <thead>
                <tr>
                    <th style="text-align: left;" rowspan="1" width="15%">活动名称</th>
                    <th style="text-align: left;" rowspan="1" width="10%">创建时间</th>
                    <th style="text-align: left;" rowspan="1" width="10%">开始时间</th>
                    <th style="text-align: left;" rowspan="1" width="10%">结束时间</th>
                    <th style="text-align: left;" rowspan="1" width="55%">活动内容</th>
                </tr>
                </thead>
                <tbody id="activityListPaging"></tbody>
            </table>
            <div class="row">
                <div class="col-md-2 col-md-offset-2" id="per"></div>
                <div class="col-md-2 col-md-offset-2" id="pageNo"></div>
                <div class="col-md-2 col-md-offset-1" id="next"></div>
            </div>
            <table hidden="hiddenr">
                <tbody id="activityListPaging_Model">
                <tr>
                    <td style="text-align: left">
                        <a href="<%=basePath%>activity/manageActivityForm?activity_id=@@@id@">@@@activityName@</a></td>
                    <td style="text-align: left">@@@createTime@</td>
                    <td style="text-align: left">@@@startTime@</td>
                    <td style="text-align: left">@@@endTime@</td>
                    <td style="text-align: left">@@@context@</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>
<script type="text/javascript">
    pagingStart2('#activityListPaging', '#activityListPaging_Model','#per','#next','#pageNo', '/activity/getActivitysOrderByCreateTime?PageSize=5')
</script>
</body>
</html>