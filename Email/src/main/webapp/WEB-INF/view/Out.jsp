<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
					<div class="modal-body" ">
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
		<input type="text" class="form-control" id="uname" placeholder="好友全程/或者缩写">
	</div>
	<div class="haoyouLi">
		<ul class="haoyou_ul">

		</ul>
	</div>
</div>
	<div class="bg-success tongzhi">
		
		  <button class="btn btn-success  bnss bnts1" >发送</button>
		  <button class="btn btn-success   bnss bnts2">存草稿</button>
	    
</div>
</div>


	<script type="text/javascript">
	
	
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
			$.ajax("/Email/Home/getUser", {
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
		
		$(".bnts1").on("click",function(){
			
			//发信箱
			var email =  new Array();
			
			//收件人
			var user_show= new Array();//定义数组
			var user_show_val = $("#number").val();//获取值
			var result_shou=user_show_val.split(";");//已;号进行分割
			result_shou.splice(user_show.length-1,1);//删除空值
			
				//console.log(result_shou)
			//密送人
			var user_mi= new Array();
			var user_mi_val = $("#misongval").val();//获取值
			var result_mi=user_mi_val.split(";");//已;号进行分割
			result_mi.splice(user_mi.length-1,1);//删除空值
			//console.log(result_mi)
					
					$.ajax("/Email/Home/getUser", {
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
							console.log(data_img);
							
							
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
							str+="xuanze="+1
							console.log(str);
							
							$.ajax("/Email/file/fileEmail?"+str, {
								type: "POST",
								success: function(json) {
									tishi('发送成功！');
									
								}
							});
						}
					});

		});
		$(".bnts2").on("click",function(){
			
			//发信箱
			var email =  new Array();
			
			//收件人
			var user_show= new Array();//定义数组
			var user_show_val = $("#number").val();//获取值
			var result_shou=user_show_val.split(";");//已;号进行分割
			result_shou.splice(user_show.length-1,1);//删除空值
			
				//console.log(result_shou)
			//密送人
			var user_mi= new Array();
			var user_mi_val = $("#misongval").val();//获取值
			var result_mi=user_mi_val.split(";");//已;号进行分割
			result_mi.splice(user_mi.length-1,1);//删除空值
			//console.log(result_mi)
					
					$.ajax("/Email/Home/getUser", {
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
							console.log(data_img);
							
							
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
							str+="xuanze="+2
							console.log(str);
							
							$.ajax("/Email/file/fileEmail?"+str, {
								type: "POST",
								success: function(json) {
									tishi('存入成功！');
									
								}
							});
						}
					});

		});
	
	
	</script>