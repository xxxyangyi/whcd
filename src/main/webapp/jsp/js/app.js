$(document).ready(function(){
//	alert("页面加载完成");
	var cus=null;
//	--------------弹出框提交信息-------------------------------------
	$("#sub_edit_info").click(function(){
		$('#myModal').modal('hide');
		console.log("弹出框提交信息");
		var first_name = $("#first_name").val();
		var last_name =$("#last_name").val();
		var email = $("#email").val();
		var address = $("#address").val();
		var customer_id=$("#hidden").val();
		console.log(first_name+last_name+email+address+customer_id);
		$.ajax({
			type: "post",
			data: {first_name: first_name, last_name: last_name,email:email,address:address, customer_id:customer_id},
			url: "/StrutsExam8376/Customer/edit",
			async: true,
			success: function (msg) {
				if (msg == 1) {
					alert("修改成功");
					console.log("修改成功");
					window.location.href="/StrutsExam8376/index.jsp"; 
				} else {
					alert("修改失败");
					console.log("修改成功");
				}
			}
		})
	})
//	---------------------------addCustomer----------------------------------------------------------- 
	$("#addCus").click(function(){
		console.log("addCustomer   ==========");
		window.location.href="/StrutsExam8376/addCustomer.jsp";    
	});

	//----------------------添加Customer-------------------------------------------------   
	$("#submit").click(function () {
		var first_name = $("#first_name").val();
		var last_name  = $("#last_name").val();
		var email      = $("#emailinfo").val();
		var address    = $("#address").val();
		console.log(first_name+last_name+"--"+email+address);
		alert("----"+first_name+last_name+"--"+email+address);
		if (first_name == '' || last_name == ''|| email==""||address=="") {
			alert("信息不可为空,请重新输入!");
		} else {
			$.ajax({
				type: "post",
				data: {first_name: first_name, last_name: last_name, email:email, address:address},
				url: "/StrutsExam8376/Customer/add",
				async: true,
				success: function (msg) {
					if (msg == 1) {
						alert("添加成功!");
						window.location.href="/StrutsExam8376/index.jsp"; 
					} else {
						alert("添加失败");
					}
				}
			})
		}
	});
	//--------------------------------------显示customer 信息----------------------------------------------------------
	$("#cus_btn").click(function(){
		console.log("进入");
		console.log("开始请求数据");	
		//----------------------------------------获取数据--------------------------------------------
		$.ajax({
			type:"post",
			date:{},
			url:"/StrutsExam8376/Customer/info",
			dataType:'json',
			success:function(msg){
				cus=msg;
				console.log(cus);       		
				console.log("  cus"+cus.Customer.length+" " );       		
			}  	
		});

	});
	//---------------------------------------循环打印----------------------------------------------        
	var i= 1;
	var suminfo=null;
	var sumpage = null;
	var now =1;
	var nowinfo =1;

	$("#page_btn1").click(function(){

		if(cus==null){
			alert("没有可以使用的信息");
		}else{
			suminfo= cus.Customer.length
			console.log(suminfo);
			sumpage = suminfo/20;
			console.log(sumpage);
		}
		now = $("#page_btn1").text();
		nowinfo = now*20;
		console.log("nowinfo"+nowinfo);
		showinfo(nowinfo);
	});


	$("#page_btn2").click(function(){

		if(cus==null){
			alert("没有可以使用的信息");
		}else{
			suminfo= cus.Customer.length
			console.log(suminfo);
			sumpage = suminfo/20;
			console.log(sumpage);
		}
		now = $("#page_btn2").text();
		nowinfo = now*20;
		console.log("nowinfo"+nowinfo);
		showinfo(nowinfo);
	});

	$("#page_btn3").click(function(){

		if(cus==null){
			alert("没有可以使用的信息");
		}else{
			suminfo= cus.Customer.length
			console.log(suminfo);
			sumpage = suminfo/20;
			console.log(sumpage);
		}
		now = $("#page_btn3").text();
		nowinfo = now*20;
		console.log("nowinfo"+nowinfo);
		showinfo(nowinfo);
	});

	function showinfo(end){
		var i=end-20;
		$("#addinfo").empty();
		for(i;i<end;i++){        		
			$("#addinfo").append(
					"<tr>"+
					"<td>"
					+"<div class='btn-group'>"
					+"<button class='btn btn-info btn-sm' type='button' onclick='edit(this)'>编辑</button>"		
					+"<button class='btn btn-info btn-sm' type='button' onclick='dele(this)'>删除</button>"
					+"</div>"
					+"</td>"
					+"<div >"
					+"<td>"+cus.Customer[i].first_name+"</td>"
					+"<td>"+cus.Customer[i].last_name+"</td>"
					+"<td>"+cus.Customer[i].address+"</td>"
					+"<td>"+cus.Customer[i].email+"</td>"
					+"<td>"+cus.Customer[i].customer_id+"</td>"
					+"<td>"+cus.Customer[i].last_update+"</td>"
					+"</div>"
					+"</tr>");

		}
	}
//	---------------------------------------------------------------------------------------------------
//	----------------------------------------上一页，和下一页-----------------------------------------------
	$("#page_btn_old").click(function(){
		var i = 0;
		i = Number($("#page_btn1").text());
		console.log("page_btn1   "+i);
		if(i==1){
			alert("不可以在向前了");
		}else{
			$("#page_btn1").text(i-1);
			$("#page_btn2").text(i);
			$("#page_btn3").text(i+1);
		}        	
	});
	$("#page_btn_new").click(function(){
		var i= 0;
		i = Number($("#page_btn3").text());
		console.log("page_btn1   "+i);
		$("#page_btn1").text(i-1);
		$("#page_btn2").text(i);
		$("#page_btn3").text(i+1);    	
	});

});
//-------------------------------弹出修改信息的框架---------------------------
function edit(node){
	$('#myModal').modal('show');
	var tr = node.parentNode.parentNode.parentNode;
	console.log(tr.cells[1].innerText);
	$("#first_name").val(tr.cells[1].innerText);
	$("#last_name").val(tr.cells[2].innerText);
	$("#email").val(tr.cells[4].innerText);
	$("#address").val(tr.cells[3].innerText);
	$("#hidden").val(tr.cells[5].innerText);	

}; 
//------------------------------弹出警示框------------------------------------
function dele(node){
	var mes=confirm("您确定要删除此条信息吗？");
	var tr = node.parentNode.parentNode.parentNode;
	var customer_id=tr.cells[5].innerText;
	console.log(customer_id);
	if(mes==true){ 
		$.ajax({
			type: "post",
			data: {customer_id:customer_id},
			url: "/StrutsExam8376/Customer/dele",
			async: true,
			success: function (msg) {
				if (msg == 1) {
					alert("删除成功");
					console.log("删除成功");
				} else {
					alert("删除失败");
					console.log("删除成功");
				}
			}
		});
	}
}; 
