<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写信</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<style>
 .l{
    list-style:none;
    background:pink;
    width:300px;
 }
</style>
</head>
<body>
<div class="container">
		<div class="row">
		<div class="col-md-8">
			<form action="" method="post" enctype="multipart/form-data" id="biaodan">
				<div class="form-group form-horizontal">
					<span class="col-md-2 text-center">收件人：</span>
					<div class="col-md-10">
						<input type="text" class="form-control" name="sjr" id="sjr"/>
						<div><h5><a href="javascript:void(0)" onclick="pl()">联系人列表</a></h5><input type="text" class="form-control"  placeholder="搜索" name="mohu" onchange="mohuu()"><ul class="ll"></ul></div>
					</div>
				</div>
				<div class="col-md-12" id="xscs">
					<div class="col-md-2 col-md-push-2">
						<a href="#" class="btn btn-info form-control">显示抄送</a><br/>
						<a href="#" class="btn btn-info form-control">显示密送</a>
					</div>
				</div>
				<div class="col-md-12" id="xsms">
					<div class="col-md-2 col-md-push-2">
						
					</div>
				</div>
				<div class="hidden" id="cs">
					<span class="col-md-2 text-center">抄送：</span>
					<div class="col-md-10">
						<input type="text" class="form-control" name="cs"/>
					</div>
				</div>
				<div class="form-group form-horizontal hidden" id="ms">
					<span class="col-md-2 text-center">密送：</span>
					<div class="col-md-10">
						<input type="text" class="form-control" name="ms"/>
					</div>
				</div>
				<div class="form-group form-horizontal">
					<span class="col-md-2 text-center">主题：</span>
					<div class="col-md-10">
						<input type="text" class="form-control" name="zt"/>
					</div>
				</div>
				<div class="form-group form-horizontal">
					<span class="col-md-2 text-center">发送选项：</span>
					<div class="col-md-10 checkbox">
						<label><input type="checkbox" value="1" name="hz"/> 回执</label>
					</div>
				</div>

				<div class="form-group form-horizontal"><span class="col-md-2 text-center">相关附件：</span>
					<div class="col-md-10">
						<input type="file" name="txt">
					</div>
				</div>
				<div class="form-group form-horizontal"><span class="col-md-2 text-center">文本：</span>
					<div class="col-md-10">
						<textarea cols="80" rows="10" name="wb"></textarea>
					</div>
				</div>

				<div class="form-group ">
					<div class="col-md-2 col-md-offset-2">
						<button type="submit" class="btn btn-info form-control" onclick="fasong()">发送</button>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-info form-control" onclick="caogao()">保存草稿</button>
					</div>
					<div class="col-md-2">
						<a href="#" id="tc" class="btn btn-info form-control">退出</a>
					</div>
				</div>
				<input type="hidden" name="fjr" id="fjr"/>
			</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
  function pl(){
	  $.ajax({
		 url:"/Email/email/getuser.action",
		 type:"post",
		 success:function(rs){
			 $(".ll").html("");
			 $.each(rs,function(i,obj){
				 var str="<a href='javascript:void(0)' onclick='fa("+obj.uname+")'><li class='l'>"+obj.uname+"("+obj.emailno+")</li></a>";
				 $(".ll").append(str);
			 })
		 }
	  });
  }
 function mohuu(){
	 var uname=$("[name=mohu]").val();
	 $.ajax({
		 url:"/Email/email/getusermohu.action",
		 type:"post",
		 data:{"uname":uname},
		 success:function(rs){
		 $(".ll").html("");
		$.each(rs,function(i,obj){
		var str="<a href='javascript:void(0)' onclick='fa("+obj.uname+")'><li class='l'>"+obj.uname+"("+obj.emailno+")</li></a>";
		$(".ll").append(str);
			 })
		 }
	 })
 }
  
</script>







</html>