<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写信</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />

</head>
<body>
<div style="width: 95rem;">
<div class="row" >
	<div class="input1">
		    <span class="col-md-1 text-center">收件人：</span>
			<div class="col-md-7 shou">
				<input type="text" class="form-control" id="number" placeholder="请输入您要发送好友的账号/邮箱"/>
				<br />
				<label class="text-danger" id="messageMisong" onclick="misong()">密送</label>
		   </div>
	</div>
</div>
<div class="row mi" style="display: none;">
	<div class="input1 ">
		    <span class="col-md-1 text-center">密送：</span>
			<div class="col-md-7 misong">
				<input type="text" class="form-control" id="misongval" placeholder="请输入您要发送好友的账号/邮箱"/>
				<br />
				<label class="text-danger" id="misong"></label>
		   </div>
	</div>
</div>

<div class="row" >
	<div class="input1">
		    <span class="col-md-1 text-center">主题：</span>
			<div class="col-md-7">
				<input type="text" class="form-control" id="zhuti" placeholder="主题"/>
				<br />
				<label class="text-danger" id="messageNumber"></label>
		   </div>
	</div>
</div>
<div class="row" >
	<div class="input1">
		    <span class="col-md-1 text-center">附件：</span>
			<div class="col-md-7">
				<input type="file" class="file" id="fileupload" multiple="multiple" />
			
			</div>
				<br />
				<label class="text-danger" id="messageNumber"></label>
		   </div>
	</div>
</div>
<div class="row" >
	<div class="input1">
		    <span class="col-md-1 text-center">正文：</span>
			<div class="col-md-7">
				<textarea class="form-control" rows="7" cols="102" id="zhenwen"></textarea>
				<br />
				<label class="text-danger" id="">发件人${user.uname}<${user.emailno}>
					<button class="btn btn-success" onclick="gg()">其它选项</button>
					<label class="vv" style="display: none;">
						 需要回执：
					<input type="checkbox" value="1" name="getemail" />
					</label>
				</label>
			</div>
	</div>
	<div id="tishi" class="modal fade" data-backdrop="static" data-keyboard="false" ">
			<div class="modal-dialog modal-sm" ">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h6 class="modal-title"></h6>
					</div>
					<div class="modal-body">
						<h6 class="text-center">message</h6>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary" onclick="count()">确认</button>
					</div>
				</div>
			</div>
		</div>
</div>
<div class="haoyou">
	<div class="haoyou_1">
		<label class="text-danger">好友列表</label>
	</div>
	<div class="haoyou_2">
		<input type="text" class="form-control" id="uname" placeholder="好友全程/或者缩写" onchange="mohuu()">
	</div>
	<div class="haoyouLi">
		<ul class="haoyou_ul">

		</ul>
	</div>
</div>
	<div class="bg-success tongzhi">
		
		  <button class="btn btn-success  bnss">发送</button>
		  <button class="btn btn-success   bnss">存草稿</button>
	    
</div>
</div>


	<script type="text/javascript">
	 function mohuu(){
		 
		 
			 var uname=$("#uname").val();
			 
			 $.ajax({
				 url:"/Email/email/getusermohu.action",
				 type:"post",
				 data:{"uname":uname},
				 success:function(rs){
				 $(".haoyou_ul").html("");
				$.each(rs,function(i,obj){
				var $li = '<li name="user"><span>'+obj.uname+'</span><input type="hidden" name="user_emailno" value="'+obj.emailno+'" /></li>';
				$(".haoyou_ul").append($li);
					 })
				 }
			 })
			 
		 }
	 
	  
	
	var filelist = new Array();
	
		$(function(){
			getUser("");
		});
	
		$("#uname").blur(function(){
			getUser(this.value);
		});
		function misong(){
			$(".mi").toggle();
		}
		function gg(){
			$(".vv").toggle();
		}
		function tishi(msg) {
			//模态框信息
			$("#tishi").find(".modal-content h6").text(msg);
			$("#tishi").modal(); //显示
		
		}
		function getUser(uname){
			var data= {
				"uname":uname
			}
			$.ajax("/Email/email/getusermohu.action", {
				type: "POST",
				data:data,
				success: function(json) {
					
					$(".haoyou_ul").html("");
					$.each(json,function(i,obj){
						var $li = '<li name="user"><span>'+obj.uname+'</span><input type="hidden" name="user_emailno" value="'+obj.emailno+'" /></li>';
						$(".haoyou_ul").append($li);
					})
					
				}
			});
		}
		
		var $jdtxt=$(".shou").find("input");
		$(".shou").find("input").focus(function(){
			$jdtxt=$(this);
		});
		$(".misong").find("input").focus(function(){
			$jdtxt=$(this);
		});
		$(".haoyou_ul").on("click","[name='user']",function(){
			var zhi="";
			zhi+=$(this).find("span").text();
			zhi+="<"+$(this).find("input").val()+">;";
			var value=$jdtxt.val();
			if(value.indexOf(zhi)==-1){
				value+=zhi;
				$jdtxt.val(value)
			}
		});
		
		$(".bnss").on("click",function(){
			var id=${user.uid};
			//发信箱
			var email =  new Array();
			
			//收件人
			var user_show= new Array();//定义数组
			var user_show_val = $("#number").val();//获取值
			var result_shou=user_show_val.split(";");//已;号进行分割
			result_shou.splice(user_show.length-1,1);//删除空值
			
				console.log(result_shou)
			//密送人
			var user_mi= new Array();
			var user_mi_val = $("#misongval").val();//获取值
			var result_mi=user_mi_val.split(";");//已;号进行分割
			result_mi.splice(user_mi.length-1,1);//删除空值
			console.log(result_mi)
					
					$.ajax("/Email/email/getusermohu.action", {
						type: "POST",
						data:{},
						success: function(json) {		
							var data_shou=[];
							var data_ms=[];
							$.each(json,function(j,l){
								var zhi="";
								zhi+=l.uname;
								zhi+="<"+l.emailno+">;";
								var xiu=zhi.split(";");
								xiu.splice(user_show.length-1,1);
								$.each(result_shou,function(i,v){
									if(v==xiu){
										data_shou[i]=l.uid;
									}
								});
							});
							$.each(json,function(x,vc){
								var zhi="";
								zhi+=vc.uname;
								zhi+="<"+vc.emailno+">;";
								var xiu=zhi.split(";");
								xiu.splice(user_mi.length-1,1);
								$.each(result_mi,function(i,v){
									if(v==xiu){
										data_ms[i]=vc.uid;
									}
								});
							});
							
							
							var data_img=[];
							var file=document.getElementById("fileupload").files;
										
										$.each(file, function(i, obj) {
											data_img[i]=obj.name
										});
						
										
										
										var str = "";
										if(data_shou.length!=0){
											str+="data_shou="+data_shou+"&"
										}
										if(data_ms.length!=0){
											str+="data_ms="+data_ms+"&"
										}
										if(data_img.length!=0){
											str+="data_img="+data_img+"&"
										}
										if($("#zhuti").val()!=""){
											str+="title="+$("#zhuti").val()+"&"
										}
										if($("#zhenwen").val()!=""){
											str+="content="+$("#zhenwen").val()+"&"
										}
										if($("[name=getemail]:checked").val()!=""){
											str+="getemail="+$("[name=getemail]:checked").val()+"&"
										}
							$.ajax("/Email/email/fileEmail.action?"+str+"&uid="+id+"", {
								type: "POST",
								success: function(json) {
									alert('发送成功');
									ojbk();
									
								}
							});
						}
					});

		});

		
		/*$("#fileupload").on( "change", function(e) {
						var size = 0;
						$.each(this.files, function(i,obj) {
							size += obj.size;
						});
						if(size > (1024 * 1024 * 5)) {
							this.value = "";
							alert("目前只支持小于5M的总文件大小");
							return false;
						}
						var addImags =$("#fileupload").prop('files');
						$.each(addImags, function(i,obj) {
							var fr = new FileReader();
							var file = obj;
							fr.readAsDataURL(file);//读取文件
							fr.onload = function(){
								var fileObj = {};//filename,fileaddress,filesize
								var base64Data = this.result;//获得base编码字符串格式
								fileObj["filename"] = file.name;//设置文件名
								fileObj["fileur"] = base64Data.substring(base64Data
										.indexOf(';base64,') + 8);//设置base64数据字符串
								fileObj["filesize"] = obj.size;
								filelist.push(fileObj);
							};
						});
						
					});
		
			//支持的文件类型正则表达式*/
	
	</script>
</body>
</html>