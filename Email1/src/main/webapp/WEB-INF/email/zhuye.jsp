<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="/Email/">
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>主页</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="bg-primary">
					<img src="image/logo.png" width="285px" height="80px"/>
				</h1>
			</div>
			<div class="col-md-12">
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked">
						<li role="presentation" id="yj" class="active"><a href="#"><h4 align="center"><b><span class="glyphicon glyphicon-envelope" aria-hidden="true">&nbsp;建坤邮箱</b></h4></a></li>
						<li role="presentation" id="xx"><a><span class="glyphicon glyphicon-record" aria-hidden="true"></span>写信</a></li>
					    <li role="presentation" id="xj"><a><span class="glyphicon glyphicon-record" aria-hidden="true"></span>新建文件架</a></li>
					</ul>	
					<ul class="nav nav-pills nav-stacked" id="ok">
					
						
							<!--
						<li role="presentation" id="sjx" data-xy="0"><a><span id="tb" class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>收件箱<span id="wds" class="badge"></span></a></li>
					
						<li role="presentation" id="wd" style="display: none;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-record" aria-hidden="true">未读邮件</a></li>
						<li role="presentation" id="yd" style="display: none;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-record" aria-hidden="true">已读邮件</a></li>
						<li role="presentation" id="cg"><a href="#"><span class="glyphicon glyphicon-record" aria-hidden="true"></span>草稿箱</a></li>
						<li role="presentation" id="fa"><a href="#"><span class="glyphicon glyphicon-record" aria-hidden="true"></span>发件箱</a></li>
						<li role="presentation" id="fei"><a href="#"><span class="glyphicon glyphicon-record" aria-hidden="true"></span>废件箱</a></li>
						<li role="presentation" id="tui"><a href="#"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>退出邮箱</a></li>
					<-->
					</ul>
				</div>
				<div class="col-md-10" id="xianshi">
					<div class="jumbotron" style="background-color: #69f;">
						<h1>欢迎您,${user.uname} <b id="b"></b>!</h1>
						<p><img src="image/ad.png"/></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 消息提示框 -->
	<div id="alertDialog" class="modal fade" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h6 class="modal-title">系统提示</h6>
				</div>
				<div class="modal-body">
					<h3 class="text-center">message</h3>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 窗体模式框 -->
	<div id="windowDialog" class="modal fade" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h6 class="modal-title">模块提示</h6>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$("#xx").click(function(){
	$("#xianshi").load("/Email/email/xiexin.action");
	
})
$("#xj").click(function(){
	var id=${user.uid};
	var ok=prompt("请输入文件架名");
	if(ok==null){
		 fnShowAlert("您没有输入任何内容哦");
	}else{
	$.ajax({
		 url:"/Email/email/savewen.action",
		 type:"post",
		 data:{"name":ok,"id":id},
		 success:function(rs){
			 if(rs==2){
				 alert(ok+"文件夹创建成功"); 
				 ojbk();
			 }else if(rs==1){
				 alert(ok+"文件夹已存在不能在创建哦"); 
			 }
		 }
	})
	}
})
$(function(){

	ojbk();
})
function ojbk(){
	 var id=${user.uid};
		$.ajax({
			 url:"/Email/email/zhuye.action",
			 type:"post",
			 data:{"uid":id},
			 success:function(result){
				$("#ok").html("");
				 $.each(result,function(i,obj){
					
					 var str="<li role='presentation' onclick='ok("+obj.efid+")' id='ii'><a><span class='glyphicon glyphicon-record' aria-hidden='true'></span>"+obj.foldername+"("+obj.count+")</a></li>";
					$("#ok").append(str);		
				 })
			 }
			
		});
}

function ok(efid){
	var uid=${user.uid};
	if(efid==3){
		$("#xianshi").load("/Email/email/shoujian.action?efid="+efid+"&uid="+uid+"");
	}else if(efid==4){
		$("#xianshi").load("/Email/email/fajian.action?efid="+efid+"&uid="+uid+"");
    }else if(efid==5){
	    $("#xianshi").load("/Email/email/laji.action?efid="+efid+"&uid="+uid+""); 
}

//显示提示框
function fnShowAlert(msg) {
	$("#alertDialog").find(".modal-body h3").text(msg);
	$("#alertDialog").modal();//显示
}

//显示窗体
function fnShowWindow(url,title) {
	$("#windowDialog").find(".modal-title").text(title);
	$("#windowDialog").find(".modal-body").load(url+"?r="+Math.random());//ajax加载页面
	$("#windowDialog").modal();
}
}





</script>
</body>
</html>