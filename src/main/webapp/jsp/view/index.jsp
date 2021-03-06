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
    <title>首页</title>
</head>
<body>
<div class="col-md-8">
    <h3>最新更新风景人文</h3>
    <div id="pageSceneryList"></div>
    <div id="pageSceneryList_Model" hidden="hidden">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading">
                            <a href="javascript:scenery.goToSceneryDetail('@@@id@')">
                                @@@summary@
                            </a>
                        </h4>
                        <p>
                            @@@detailSub@
                        </p>
                    </div>
                    <div class="media-right media-middle">
                        <a> <img class="media-object" style="margin-top: 20px;" src="@@@picaddr@"
                                 onload="AutoResizeImage(100,100,this)"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-4">
    <h3>最新更新活动</h3>
    <div id="pageActivityList"></div>
    <div id="pageActivityList_Model" hidden="hidden">
        <div class='panel panel-default'>
            <div class='panel-body'>
                <div class='media'>
                    <div class='media-left media-middle'>
                        <img class='media-object' height='50px' width='50px' src='jsp/image/sky.jpg'>
                    </div>
                    <div class='media-body'>
                        <h4 class='media-heading'>
                           <a href="/activity/getActivityVotesPassed?activity_id=@@@id@">
                            @@@activityName@
                            </a>
                        </h4>
                        @@@context@
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    pagingStart('#pageSceneryList', '#pageSceneryList_Model', '/scenery/pagingScenery',false);
    pagingStart('#pageActivityList', '#pageActivityList_Model', '/activity/pagingActivity',false);
</script>
</body>
</html>