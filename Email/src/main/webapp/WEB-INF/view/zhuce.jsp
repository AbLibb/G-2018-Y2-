<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="/Email/">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script src="js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="header col-lg-12"
		style="display: flex; justify-content: space-between; background-color: #EFF4FA; padding: 1rem; margin-bottom: 15rem;">
		<a class="header_logo" href="/"><img
			src="img/qqmail_logo_default_35h206ff1.png" /></a>
		<div class="header_link" style="font-size: 13px; padding-top: 1rem;">
			<a href="#">基本版</a>&nbsp;|&nbsp; <a href="#">English</a>&nbsp;|&nbsp;
			<a href="#" target="_blank">手机版</a>&nbsp;|&nbsp; <a href="#"
				target="_blank">企业邮箱</a>
		</div>
	</div>

	<div class="content"
		style="height: 15rem; width:100%; padding-left: 10rem;">
		<div class="login_pictures" style="">
			<div class="login_pictures_txt" style="float: left;">
				<p class="text-primary" style="font-size: 20px;">QQ邮箱，常联系！</p>
				<p>1987年9月14日21时07分</p>
				<p>中国第一封电子邮件</p>
				<p>从北京发往德国</p>
				<p>“越过长城，走向世界”</p>
				<p class="login_pictures_info">插画来自丑丑(两岁)</p>
			</div>
			<div id="" style="padding-left: 20rem;">
				<img src="img/dn.jpg" />
			</div>
		</div>

		<div class="" id="login"
			style="width: 375px; height: 450px; position: relative; top:-35rem; left: 60rem; border: 1px solid black;">
			<h3 class="text-center"
				style="background-color: #EFF4FA; padding: 0; margin: 0; height: 5rem; line-height: 5rem; border-bottom: 1px solid black;">注册</h3>

			<div class="" style="padding: 1rem 5rem 1rem 5rem;">
				<div class="form-group">
					<input type="text" id="uname" placeholder="用户名" value=""
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="password" id="upwd" value="" placeholder="密码"
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="password" id="upwd1" value="" placeholder="再次输入密码"
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="text" id="emailno" placeholder="邮箱" value=""
						class="form-control" />
				</div>

				<div class="form-group">
					<input type="radio" name="sex" value="0" class="" checked="" />男 <input
						type="radio" name="sex" value="1" class="" />女
				</div>
				<div class="form-group">
					<input type="text" id="phone" placeholder="联系电话" value=""
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="button" onclick="zc()" id="" value="注册"
						class="btn-block btn btn-primary" />
				</div>

		
			</div>

		</div>

	</div>
	<script>
		function zc() {
			
			var uname = $("#uname").val()
			var upwd = $("#upwd").val()
			var upwd1 = $("#upwd1").val()
			var emailno = $("#emailno").val();
			var phone = $("#phone").val();
			var sex = $("[name=sex]:checked").val();
			

			if (uname == "") {
				alert("请输入账号");
				return false;
			}

			if (upwd == "") {
				alert("请输入密码");
				return false;
			}
			if (upwd1 == "") {
				alert("请确认密码");
				return false;
			}
			if (upwd != upwd1) {
				alert("两次密码输入的不一样，请重新输入");
				return false;
			}

			if (upwd1 == "") {
				alert("请输入邮箱");
				return false;
			}

			$.ajax({
				type : "post",
				url : "/Email/User/doinsert",
				data : {
					"uname" : uname,
					"upwd" : upwd,
					"emailno" : emailno,
					"sex" : sex,
					"phone" : phone
				},
				dataType : "json",
				async : true,
				success : function(rs) {
					alert("新增成功");
					location.href="/Email/User/Login";
				}
			});

		}
	</script>
</body>
</html>