<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="/Email/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body background="image/img-cd5a81457d0aee8cf6b8fda9175e2263.jpg">
	<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-7 col-md-push-6" style="background: #fff;margin-top: 30px;border-radius: 8px;height: 400px;">
						<br/><br/><br/><br/><br/><br/>
						
							
						
						<div class="modal-body">
						
					
							<div class="form-group form-horizontal">
                             	<span class="col-md-3 text-center"><h4>用户名:</h4></span>
								<div class="col-md-7">
									<input type="text" class="form-control" id="zh"/>
								</div>
							</div>
							<br/><br/><br/><br/>
							<div class="form-group form-horizontal">
								<span class="col-md-3 text-center"><h4>密码:</h4></span>
								<div class="col-md-7">
									<input type="text" class="form-control" id="mm"/>
								</div>
							</div>
						</div>
							<br/><br/>
							
						<div class="modal-footer">
							<div class="form-group ">
								<div class="col-md-8 col-md-offset-3">
									
									<button class="btn btn-group-justified"  data-dismiss="modal" id="save" onclick="login()">登录</button>
								</div>
							</div>
							<div class="form-group" style="margin-left: -330px;">
								<div class="col-md-4 col-md-offset-3">
									<input type="checkbox" class=""/> 记住密码
								</div>
							</div>
							<div class="form-group " style="margin-top: -250px; margin-left: 100px;">
								<div class="col-md-6 col-md-offset-3">
									<p>
										<a href="/Email/email/zhuce">没有账号，注册</a>
									</p>
								</div>
							</div>
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
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">

//显示提示框
function fnShowAlert(msg) {
	$("#alertDialog").find(".modal-body h3").text(msg);
	$("#alertDialog").modal();//显示
}
function login(){

	var name=$("#zh").val();
	var pwd=$("#mm").val();
	alert(name);
	$.ajax({
		url:"/Email/email/dologin",
        type:"post",
        data:{"uname":name,"upwd":pwd},
        success:function(rs){
        	
        	if(rs==1){
        		alert("登录成功");
        		location.href="/Email/email/main";
        	}else{
        		alert("登陆失败");
        	}
         
        }
	});
	
}

</script>
</html>