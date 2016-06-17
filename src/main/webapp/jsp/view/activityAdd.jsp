<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>创建投票信息</title>
<script type="text/javascript">
	$(function() {
		$('#activityStartTime').datetimepicker({
			 format: 'DD/MM/YYYY'
		});
	});
	$(function() {
		$('#activityEndTime').datetimepicker({
			format: 'DD/MM/YYYY'
		});
	});
</script>

</head>

<body>
			<div class="col-md-9">
				<hr align="left" width="100%" size="15" />

				<div class="panel panel-default">
					<div class="panel-heading">请您填写活动的基本信息</div>
					<div class="panel-body">
						<form action="<%=basePath%>activity/activityAdd" method="post">
							<div class="form-group">
								<label for="activityName">活动名称：</label> <input type="text"
									name="activity.activityName" class="form-control"
									id="activityName" placeholder="活动名称">
							</div>
							<div class="form-group">
								<label for="activityContext">活动简介：</label>
								<textarea style="height: 100px" class="form-control"
									name="activity.context" id="activityContext"
									placeholder="活动简介："></textarea>
							</div>

							<div class="form-group">
								<label for="activityStartTime">活动开始时间：</label> <input
									type="text" class="form-control" name="time1"
									id="activityStartTime" placeholder="活动开始时间">
							</div>
							<div class="form-group">
								<label for="activityStartTime">活动结束时间：</label> <input
									type="text" class="form-control" name="time2"
									id="activityEndTime" placeholder="活动结束时间">
							</div>
							<button type="submit" class="btn btn-default">提交</button>
						</form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
	<script src="jsp/js/bootstrap-datetimepicker.js"></script>
			<script type="text/javascript">
		
		$(".list-group a").each(function() {
	         $(this).removeClass("active");
	 });
		$(".list-group a").eq(1).addClass("active");
	</script>
</body>
</body>
</html>