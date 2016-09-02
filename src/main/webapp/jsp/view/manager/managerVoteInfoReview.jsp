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

<title>审核</title>
</head>

<body>
	<div class="col-md-10">
		<div class="panel panel-default">
			<div class="panel-heading">审核</div>
			<div class="panel-body">
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
										<button class="btn btn-default btn-sm"
											onclick="showlargeImg(this)">大图看详情</button>
										<button class="btn btn-primary btn-sm"
											onclick="managerVoteInfoReview(<s:property value='#id.id'/>,1)">通过</button>
										<s:if test="flag==1">
										<button class="btn btn-primary btn-sm"
											onclick="managerVoteInfoReview(<s:property value='#id.id'/>,2)">不通过</button>
										</s:if>
										<script type="text/javascript">
											var url_perfix = "http://localhost:8080/";
											function managerVoteInfoReview(voteId,review) {
												alert('voteId'+voteId+'  review'+review);
													$.ajax({
														type : "post",
														data : {vote_id:voteId,review:review},
														url : url_perfix+"activity/managerVoteInfoReviewPassORNotPass",
														async : false,
														success : function(msg) {
															alert(msg)
															
														}
													});
													window.location.reload();
											}
										</script>
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