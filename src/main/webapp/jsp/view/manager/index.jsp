<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.hand.entity.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User manager = (User) session.getAttribute("expert");
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>后台系统首页</title>
    <pageid name="index"></pageid>
</head>

<body>
<div class="col-md-10">
    <div class="panel-body">
        <div style="width: 200px;margin: 0px auto; "><h3>欢迎！<s:property
                value="#session.get('user').getName()"></s:property>登陆</h3></div>
        <div class="row">
            <div class="col-md-6">
                <div>
                    <div style="float:left">性别比例</div>
                    <div style="float:right">
                        <div style="margin-bottom: 5px">
                            <span>用户男</span><img src="<%=basePath%>jsp/img/userM.png"/>
                        </div>
                        <div>
                            <span>用户女</span><img src="<%=basePath%>jsp/img/userW.png"/>
                        </div>
                    </div>
                </div>
                <div id="canvasUserSex">
                    <canvas id="canvasUserSexArea" width="200" height="200"/>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <div style="float:left">职业比例</div>
                    <div style="float:right">
                        <div style="margin-bottom: 5px">
                            <span>专家</span><img src="<%=basePath%>/jsp/img/authorM.png"/>
                        </div>
                        <div>
                            <span>游客</span><img src="<%=basePath%>/jsp/img/touristM.png"/>
                        </div>
                    </div>
                </div>
                <div id="canvasIdentity">
                    <canvas id="canvasIdentityArea" width="200" height="200"/>

                </div>
            </div>
        </div>
        <div style="float: left;margin-left: 120px;margin-top: 20px;">
            <div style="text-align: center">12个月中数据创建折线图</div>
            <div>用户上传的各类风景饮食文化数据数量</div>
            <div id="canvasMonth">
                <canvas id="canvasMonthArea" width="400" height="300"/>

            </div>
            <div style="float:right">月份</div>

        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>jsp/js/JsFramework/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jsp/js/mychart.js"></script>
</body>
</html>
