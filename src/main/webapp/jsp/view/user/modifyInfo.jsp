<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.hand.entity.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    User user = (User) session.getAttribute("user");
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改个人信息</title>
    <pageid name="modifyInfo"></pageid>
</head>

<body>
<div class="col-md-10">
    <div class="panel panel-default">
        <div class="panel-heading">
            修改个人信息
            <div style="float: right;margin-top: -5px;">
                <input id="nameMdf" type="button" value="修改" class=" btn btn-danger" onclick="Modify('name')"/>
                <input id="nameConf" type="button" value="确认" class=" btn btn-success" onclick="Config('name')"
                       style="display: none"/>
                <input id="nameCac" type="button" value="取消" class=" btn btn-warning" onclick="Cancel('name')"
                       style="display: none"/>
            </div>
        </div>
        <div class="panel-body">
            <form id="resistForm" action="<%=request.getContextPath()%>/PersonCenter/DoModifyInfo" method="post">
                <div>
                    <label style="display: block;">用户名：</label>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <input type="text" class="form-control " id="name" name="name" value="<%=user.getName()%>"
                               disabled="disabled"/>
                    </div>
                </div>
                <div>
                    <label for="password" style="display: block;">密&nbsp&nbsp码：</label>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <input type="password" id="password" class="form-control" value="<%=user.getPassword()%>"
                               name="password" disabled="disabled"/>
                    </div>
                </div>
                <div>
                    <label style="display: block;">性&nbsp&nbsp别：</label>
                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%
                            if (user.getSex() == 1) {
                        %>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                            <input type="radio" name="sex" value="1" aria-label="..." checked="checked">
                            <span>男</span>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 ">
                            <input type="radio" name="sex" value="0" aria-label="...">
                            <span>女</span>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
                            <input type="radio" name="sex" value="1" aria-label="...">
                            <span>男</span>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 ">
                            <input type="radio" name="sex" value="0" aria-label="..." checked="checked">
                            <span>女</span>
                        </div
                        <%
                            }
                        %>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel-footer"></div>
</div>
</div>
<script type="text/javascript">
    var str = new Object();
    function Modify(inputId) {
        $("#resistForm input").each(function () {
            $(this).removeAttr("disabled");
        });
        $("#" + inputId + "Mdf").hide();
        $("#" + inputId + "Conf").show();
        $("#" + inputId + "Cac").show();
    }
    function Cancel(inputId) {
        window.location.reload();
    }
    function Config(inputId) {
        $("#resistForm").submit()
    }
    function Reset() {
        window.location.reload();
    }
</script>
</body>
</html>