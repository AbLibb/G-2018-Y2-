<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

		<div role="tabpanel" class="tab-pane active" id="write">
			<div class="twoheader">
				
				<button class="btn huizhi" >回执</button>
			</div>
			<div class="huifuSection">
				<div>321321312</div>
				<div>发件人：<span class="yx">3025964715</span>
					<3025964715@qq.com>
				</div>
				<div>时&nbsp;&nbsp;&nbsp;间：2018年1月23日(星期二) 下午3:22
				</div>
				<div>收件人：<span class="na">小黄啊</span>
					<3025964715@qq.com>
				</div>
			</div>
			<div class="content">
				哈哈哈哈哈哈哈哈哈或哈哈哈哈或或或或或或或或或或或或或或或
				
			</div>
			<div id="fj" style="padding-top: 10px;padding-bottom: 10px;padding-left: 10px;height: 15rem;">

			</div>
			<div class="huifu">
				<textarea rows="1" placeholder="快捷回复给：3025964715" class="textss"></textarea>
				<button class="btn husss" style="display: none;margin-left: 20px;">发&nbsp;&nbsp;&nbsp;送</button>
			</div>
			
		</div>
		<div id="huizhiMessage" class="modal fade" data-backdrop="static" data-keyboard="false" ">
			<div class="modal-dialog modal-sm" ">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h6 class="modal-title"></h6>
					</div>
					<div class="modal-body" ">
						<h6 class="text-center">message</h6>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
<script>
	$(function(){
		var esid = ${esid};
		var scicemail = ${scicemail};
		var fasongId = 0;
		$.post("/Email/Home/getEemail",{"esid":esid,"scicemail":scicemail},function(rs){
			console.log(rs);
			if(rs.getemail!=1){
				$(".huizhi").hide();
			}else{
				$(".huizhi").attr("onclick","hz("+rs.euser.uid+")")
			}
			$(".husss").attr("data-id",rs.euser.uid);
			$(".huifuSection").children().eq(0).text(rs.title);
			
			var date=new Date(rs.senddate);
			var time=date.getFullYear()+"-"+date.getMonth()+1+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
			
			$(".huifuSection").children().eq(2).html("时间"+time);
			
			$(".huifuSection").children().eq(3).html("");
			$(".huifuSection").children().eq(3).html("收件人:")
			
			$.each(rs.erelations,function(){
				if(this.scicemail==1){
					$(".huifuSection").children().eq(1).html('发件人：<span class="yx">******</span><'+rs.euser.emailno+'>');
				}else{
					$(".huifuSection").children().eq(1).html('发件人：<span class="yx">******</span><'+rs.euser.emailno+'>');
				}
				$(".huifuSection").children().eq(3).append('<span class="na">'+this.euser.uname+'</span><'+this.euser.emailno+'>');
			})
			$(".huifu").find("textarea").attr("placeholder","快捷回复给："+rs.euser.uname+"")
			$(".huifuSection").next().html(rs.content);
		});
		var esid = ${esid};
		console.log(esid)
		
		$.post("/Email/Home/image",{"esid":esid},function(image){
			$("#fj").html("");
			$.each(image,function(i,obj){
				
				var $div = "<div><img alt='' src='/Email/img/"+this.filename+"' width='100px' height='100px'></div>";
				$("#fj").append($div);
			});
			console.log(image)
		});
	})
	$(".huifu").find("textarea").focus(function(){
				$(this).css("height","120");
				$(this).attr("placeholder","");
				$(".huifu").find("button").css("display","block")
	})
	$(".husss").on("click",function(){
		hf($(".textss").val(),$(this).attr("data-id"));
	});
	function huizhimessage(msg) {
		//模态框信息
		$("#huizhiMessage").find(".modal-content h6").text(msg);
		$("#huizhiMessage").modal(); //显示
	
	}
	function hz(id){
		var esid = ${esid};
		var userId = ${user.uid};
		var name = "${user.uname}";
		var str = name+"的回执！";
		//组装回执信息
		var Eemail = {
			"senderid":userId,
			"title":str,
			"content":"我已经接收到你的信息了！",
			"getemail":0,
			"emailstatus":0
		}
		//默认添加回执用户的收件箱
		var Erelation = {
			 "esid":esid,
			 "receivercodeid":id,
			 "emailstatus":1,
			 "efid":3,
			 "booldel":0
		}
		$.ajax({
			url:"/Email/HuiZhi/doHuizhi",
			type: "POST",
			data:Eemail,
			async:false,
			success: function(json) {	
				
			}
		})
		$.ajax({
			url:"/Email/HuiZhi/doHuizhi_1",
			type: "POST",
			data:Erelation,
			async:false,
			success: function(json) {	
				if(json==1){
					huizhimessage("回执成功！");
				}
			}
		})
	}
	function hf(text,id){
		var esid = ${esid};
		var userId = ${user.uid};
		var name = "${user.uname}";
		var str = name+"的回复！";
		//组装回执信息
		var Eemail = {
			"senderid":userId,
			"title":str,
			"content":text,
			"getemail":0,
			"emailstatus":0
		}
		//默认添加回执用户的收件箱
		var Erelation = {
			 "esid":esid,
			 "receivercodeid":id,
			 "emailstatus":1,
			 "efid":3,
			 "booldel":0
		}
		$.ajax({
			url:"/Email/HuiZhi/doHuizhi",
			type: "POST",
			data:Eemail,
			async:false,
			success: function(json) {	
				
			}
		})
		$.ajax({
			url:"/Email/HuiZhi/doHuizhi_1",
			type: "POST",
			data:Erelation,
			async:false,
			success: function(json) {	
				if(json==1){
					huizhimessage("回复成功！");
				}
			}
		})
	}	
</script>
	    		