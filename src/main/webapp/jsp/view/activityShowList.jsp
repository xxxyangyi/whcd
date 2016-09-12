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
    <title>活动清单</title>
</head>

<body>
<div class="col-md-10">
    <hr align="left" width="100%" size="15"/>
    <div class="row">
        <div id="pagingActivityList"></div>
        <!--<div id="activity_list"></div>-->
    </div>

    <div id="pagingActivityList_Model" hidden="hidden">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="media">
                        <div class="media-left media-middle">
                            <img class="media-object " height="100px" width="100px" src="jsp/image/sky.jpg">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">
                                <a href="http://localhost:8080/activity/getActivityVotesPassed?activity_id=@@@id@">
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


</div>

</div>
<script type="text/javascript">
    pagingStart('#pagingActivityList', '#pagingActivityList_Model', '<%=basePath%>activity/pagingActivity');
</script>
</body>
</html>