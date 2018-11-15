<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="/Email/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主页面</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
</head>
<body>
		<div class="container-fluid">
			<header class="row ">
				<div class="col-sm-3" id="heads">
					<p><label style="color: red;font-size: 23px;" class="dd">${user.uname}登陆成功！</label></p>
				</div>

				<div class="col-sm-1" id="heads_1">
					<button type="button" class="btn btn-success" id="close">退出</button>
				</div>
			</header>

			<section class="row" id="main">
				<div class="time"></div>
				<aside class="col-sm-2">
					<div class="list-group">
						<a href="javascript:void(0)" class="list-group-item text-center ss" data-id="product5" onclick="showPage(this,'/Email/Home/woder')">写信</a>
					</div>
					<div class="list-group">
						<a href="javascript:void(0)" class="list-group-item text-center ss" data-id="product1" onclick="showPage(this,'/Email/Home/Get')">收件箱<label class="text-danger">(未读条数:<label class="count_shoule"></label>)</label></a>
						<a href="javascript:void(0)" class="list-group-item text-center ss" data-id="product2" onclick="showPage(this,'/Email/Home/Text')">草稿箱<label class="text-danger">(<label class="count_cao"></label>)</label></a>
						<a href="javascript:void(0)" class="list-group-item text-center ss" data-id="product3" onclick="showPage(this,'/Email/Home/fa')">发信箱<label class="text-danger">(<label class="count_fa"></label>)</label></a>
						<a href="javascript:void(0)" class="list-group-item text-center ss" data-id="product4" onclick="showPage(this,'/Email/Home/Gc')">垃圾箱<label class="text-danger">(删除条数：<label class="count_shan"></label>)</label></a>
					</div>
					<div class="list-group">
						<a href="javascript:void(0)" class="list-group-item text-center ss"  onclick="hides()">其他邮箱</a>
					<div class="list-group cc">	
					
					</div>
					
						
					</div>
				</aside>
				<section id="main-content" class="col-sm-10">
					
					<div class="tab-content ">
						<div class="tab-pane fade in active row tg" id="welcome">
							
							<div class="col-sm-6" style="width: 1020px;height: 360px;">
								<p style="font-size: 20px;font-weight: bold;text-align: center;line-height: 360px;background: #ededed;">${user.uname}欢迎使用邮箱系统</p>
							</div>
						</div>
					</div>
				</section>
			</section>
			<footer></footer>
		</div>

		<!-- 所有模态框都是用myModal弹出 -->
		<div id="myModal" class="modal" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
				</div>
			</div>
		</div>
		<!-- 如果要使用Bootstrap的JS插件，必须引入jQuery -->
		<script src="js/jquery-1.12.4.js"></script>
		<!-- Bootstrap的JS插件-->
		<script src="js/bootstrap.min.js"></script>
		
		<script>
			function hides(){
				$(".cc").toggle();
			}
			function showPage(a, url) {
				$(".list-group>.list-group-item").removeClass("list-group-item-success");
				//改变选中的菜单的背景
				$(a).addClass("list-group-item-success");

				//获得id和标题文字
				var id = $(a).data("id");
				var text = $(a).text();
				var tab_content = $(".nav>li a[href*=" + id + "] ");
				//        alert(tab_content.length);
				if(tab_content.length > 0) {
					if(tab_content.closest("li").hasClass("active"))
						return;
					//当前选中的不是当前菜单对应的选项卡
					$(".nav li").removeClass("active");
					tab_content.closest("li").addClass("active");
					//切换内容的显示
					$(".tab-content .tab-pane").removeClass("in active");
					$(".tab-content .tab-pane[id=" + id + "]").addClass("in active");
					return;
				}

				  //添加标题选项卡
        var li = $('<li><a href="#'+id+'" data-toggle="tab">'+text+'</a></li>');
        $(".nav").append(li);

        //添加内容选项卡
        var div = $('<div class="tab-pane fade in" id="'+id+'"></div>');
        div.load(url);  //动态添加内容页
        $(".tab-content").append(div);
        
        $("a",li).tab("show");
			}

			function getTime() {
				var time = new Date();
				var y = time.getFullYear();
				var m = time.getMonth() + 1;
				var d = time.getDate();
				var h = time.getHours();
				var mm = time.getMinutes();
				var s = time.getSeconds();
				if(parseInt(time.getDay()) == 1) {
					x = '星期一';
				} else if(parseInt(time.getDay()) == 2) {
					x = '星期二';
				} else if(parseInt(time.getDay()) == 3) {
					x = '星期三';
				} else if(parseInt(time.getDay()) == 4) {
					x = '星期四';
				} else if(parseInt(time.getDay()) == 5) {
					x = '星期五';
				} else if(parseInt(time.getDay()) == 6) {
					x = '星期六';
				} else {
					x = '星期日';
				}
				if(parseInt(m) < 10) {
					m = "0" + m;
				}
				if(parseInt(d) < 10) {
					d = "0" + d;
				}
				if(parseInt(h) < 10) {
					h = "0" + h;
				}
				if(parseInt(mm) < 10) {
					mm = "0" + mm;
				}
				if(parseInt(s) < 10) {
					s = "0" + s;
				}
				$(".time").html(y + "年" + m + "月" + d + "日" + "&nbsp;" + h + ":" + mm + ":" + s + "&nbsp;" + x);
			}
			$(function() {
				$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
					// 获取已激活的标签页的名称
					var activeTab = $(e.target).text();
				});
				$("#myModal").on('hide.bs.modal', function() {
					$(this).removeData("bs.modal");
				});
				getTime();
				setInterval("getTime()", 1000);
			
				  count();
				
				showEmailFile();
			});
			$(function() {
				$(".nav").on("dblclick", "li", function() {
					var id = $("a", this).attr("href").substring(1);
					//            删除标题选项卡和内容选项卡
					var href = $(this).prev().find("a").attr("href");
					$($(this).prev()).tab("show");
					$(this).remove();
					$(".tab-content div#" + id).remove();
					$(".tab-content " + href).addClass("in active");
				});
				var username = $(".dd").text();
				if(username == "") {
					location.href = "/supermarket/Login.action";
				}
				$("#close").click(function() {
					$.ajax({
						url: "/Email/User/OutLogin",
						type: "post",
						success: function(rs) {
							if(rs == 1) {
								alert('注销成功！');
								location.href = "/Email/User/Login";
							}
						}
					});
				});
			});

			function count(){
				$.get("/Email/Home/shou",{"efid":3},function(data1){
					$(".count_shoule").text(data1);
					console.log(data1)
				});
				$.get("/Email/Home/yiduss",{"efid":4},function(data2){
					$(".count_fa").text(data2);
					console.log(data2)
				});
				$.get("/Email/Home/yiduss",{"efid":6},function(data3){
					$(".count_cao").text(data3);
					console.log(data3)
				});
				$.get("/Email/Home/yiduss",{"efid":5},function(data4){
					$(".count_shan").text(data4);
					console.log(data4)
				});
				$("#tishi").modal('hide');
			}
			
			function showEmailFile(){
				$(".cc").html("");
				$.get("/Email/Home/showEmailFile","",function(data){
					$.each(data,function(){
						if(this.euid!=null){
							var $a = '<a href="javascript:void(0)" class="list-group-item text-center ss"  onclick="showPage(this,\'/Email/Home/siren?efid='+this.efid+'\')">'+this.foldername+'</a>';
							$(".cc").append($a);
						}
					})
				});
			}
		</script>
		<!-- 消息提示框 -->
		<div id="alertDialog" class="modal fade" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h6 class="modal-title">系统提示</h6>
					</div>
					<div class="modal-body">
						<h5 class="text-center">message</h5>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>