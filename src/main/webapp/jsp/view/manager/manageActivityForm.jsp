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

<title>管理活动</title>
</head>

<body>
	<div class="col-md-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				<s:property value="activity.activityName" />
				详情
			</div>
			<div class="panel-body">
				<div class="panel panel-default">
					<div class="row">
						<div class="col-md-4">
							创建时间：
							<s:property value="activity.createTime" /><p>
							开始时间：
							<s:property value="activity.startTime" /><p>
							结束时间：
							<s:property value="activity.endTime" /><p>
						</div>
						<div class="col-md-4">
							参加人数：
							<s:property value="activity.userNum" /><p>
							专家人数：
							<s:property value="activity.expertNum" /><p>
							专家权重：
							<s:property value="activity.weight" /><p>
						</div>
						<div class="col-md-4"></div>
					</div>
						活动内容：<p>
						<s:property value="activity.context" />
				</div>
				<div class="grid row">
					<s:iterator value="voteList" id='id' status='st'>
						<div class="grid_item col-sm-6 col-md-4" style="float: left">
							<div class="thumbnail">
								<img
									src="<%=basePath%>jsp/img/<s:property value='#id.userImg'/>"
									alt="未知">
								<div class="caption">
									<h5>
										<div>
											作者：
											<s:property value="#id.user_id.name" />
										</div>
									</h5>
									<p>
										内容：
										<s:property value="#id.context" />
									</p>
									<p>
										<s:if test="activity.expertNum==0">
											<s:property value="(#id.voteNum)" />票			
										</s:if>
										<s:else>
											<s:property
												value="(#id.voteNum)+(#id.expertVoteNum/activity.expertNum)*(activity.weight/(1-activity.weight))*activity.userNum" />票			
										</s:else>
										<button class="btn btn-primary btn-sm"
											onclick="vote(<s:property value='activity.id'/>,'<s:property value='#id.user_id.mail'/>',<s:property value='#id.id'/>)">投一票</button>
										<button class="btn btn-default btn-sm"
											onclick="showlargeImg(this)">大图看详情</button>
										<s:property
											value="(#id.voteNum)+((#id.expertVoteNum)/(activity.expertNum))*(activity.weigth/(1-activity.weigth))*activity.voteNum" />
									</p>
								</div>
							</div>
						</div>
					</s:iterator>
					<script type="text/javascript">
					$(function(){  
						  $('.grid').masonry({  
						    // options  
						    itemSelector : '.grid_item',  
						    columnWidth : 0  
						  });  
						});
					</script>
				</div>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>


	<!-- 查看大图的模态框 -->
	<div class="modal fade" id="modalShowLargeImg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<img id="modalShowLargeImgSrc" width="100%" height="100%" src=""
					alt="未知" id="modalImg">
			</div>
		</div>
	</div>

	<script type="text/javascript">
      function showlargeImg (node) {
    	  	//alert(node.parentNode.parentNode.parentNode.firstElementChild.getAttribute('src'))
        	var tr = $(this).parent().parent().prev().attr('src');
        	$('#modalShowLargeImgSrc').attr('src',node.parentNode.parentNode.parentNode.firstElementChild.getAttribute('src'))
                $('#modalShowLargeImg').modal('show');
      };
</script>
</body>
</body>
</html>