<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>风景名胜详细信息</title>
</head>

<body>
<div class="col-md-10">
    <div id="sceneryDetail"></div>
    <div id="sceneryDetail_Model" hidden="hidden">
        <div class="panel panel-default">
            <div class="panel-heading" style="text-align: center;">
                @@@summary@
            </div>
            <div class="panel-body">
                <div class="col-lg-12">
                    详情：
                    <br/>
                    <img src="@@@picaddr@" style="float: right;margin: 5px;" onload="AutoResizeImage(300,0,this)"
                         onerror="javascript:this.src='/jsp/img/errorimg.jpg'">
                    @@@detail@
                </div>
                <div class="col-lg-12">
                    作者：@@@user_id.name@
                    <br/>
                    创建日期：@@@createDate@
                </div>
            </div>
            <div class="panel-footer"></div>
        </div>
    </div>
</div>

<script type="application/javascript">
    formInfo("#sceneryDetail", "#sceneryDetail_Model", "/Scenery/sceneryDetail?sceneryId="+localStorage["sceneryId"]);
</script>
</body>
</html>