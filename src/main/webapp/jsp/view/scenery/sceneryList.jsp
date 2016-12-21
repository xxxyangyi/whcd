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
    <title>名胜列表</title>
</head>
<body>
<div id="scennery" class="col-md-10">
    <div id="usrPanelContent">
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
                            <a> <img class="media-object" style="margin-top: 20px;"
                                     src="<%=basePath%>@@@picaddr@"
                                     onload="AutoResizeImage(100,100,this)"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    pagingStart('#pageSceneryList', '#pageSceneryList_Model', '/scenery/pagingScenery?tabId='+localStorage["tabId"]);
</script>
</body>
</html>
