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

<body onload="pagingStart('#pagingActivityList','#pagingActivityList_Model','<%=basePath%>pagingActivityService')">
<div class="col-md-10">
    <hr align="left" width="100%" size="15"/>
    <div class="row">
        <div id="pagingActivityList"></div>
        <div id="activity_list"></div>
    </div>

    <div id="pagingActivityList_Model">
    <div class="col-lg-10 col-lg-offset-2">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading">
                            <a href=""></a>
                        </h4>
                        <p style="width:470px;word-wrap:break-word;text-overflow:ellipsis">
                            +arr[i].detailSub
                        </p>
                    </div>
                    <div class="media-right media-middle">
                        <a> <img class="media-object" style="margin-top: 20px;" src=""
                                 onload="AutoResizeImage(100,100,this)" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>



    </div>

</div>
</body>
</body>
</html>