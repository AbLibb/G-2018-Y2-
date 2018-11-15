<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>收件箱</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="table-responsive">
					<div class="col-md-12">
						<div class="form-group form-horizontal">
							<span class="col-md-2 text-center">主题：</span>
							<div class="col-md-4">
								<input type="text" class="form-control" />
							</div>
							<span class="col-md-2 text-center">发件人：</span>
							<div class="col-md-4">
								<input type="text" class="form-control" id="fajian"/>
							</div>
						
						</div>
                   
						<div class="form-group form-horizontal">
							
							<span class="col-md-2 text-center">发送时间：</span>
							<div class="col-md-6">
								<input type="date" />至
								<input type="date"/>
							</div>
							 
							<div class="col-md-4">
								<button type="button" class="btn btn-info" onclick="mohu()">立即查找</button>&nbsp;
								移至<select id="lol"></select>
							</div>
						</div>
					</div>
					<div class="col-md-12">
					<br/>
					<div id="weidu"></div>
						<div class="col-md-4 col-md-push-8">
							<button type="button" class="btn btn-info" id="sjyidu">标记已读</button>&nbsp;
							<button type="button" class="btn btn-info" id="sjweidu">标记未读</button>&nbsp;
								
							<button type="button" class="btn btn-info" id="sjyichu">移&nbsp;&nbsp;&nbsp;&nbsp;出</button>
						</div>
					</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th><input type='checkbox' id="sjqx" onclick="qx()">全选</th>
								<th>状态</th>
								
								<th>发件人</th>
								<th>主题</th>
								<th>发送时间</th>
							</tr>
						</thead>
						<tbody id="tbl">

						</tbody>
					</table>
					<div align="center">
					<ul id="sjfy" class="pagination">
						  <a href="javascript:void(0)" id="one">首页</a>
                          <a href="javascript:void(0)" id="two">上一页</a>
                          <a href="javascript:void(0)" id="three">下一页</a>
                          <a href="javascript:void(0)" id="four">尾页</a> 
					</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function mohu(){
	var fajian=$("#fajian").val();
	var uid=${user.uid};
	$.ajax({
		url:"/Email/email/fajianmohu.action",
		type:"post",
		data:{"fajian":fajian,"uid":uid},
		success:function(rs){
			 $("#tbl").html("");
			 $.each(rs,function(i,obj){
				  $("#tbl").append("<tr><td><input type='checkbox' name='faidss' value='"+obj.esid+"'></td><td>"+ok+"</td><td>"+ obj.username + "</td><td>"+ obj.title + "</td><td>"+ obj.senddate + "</td></tr>");			 
			 })
		}
	})
}
  $("#sjyichu").click(function(){
	   var id=$("#lol").val();
	   var value=[];
		  var uid=${user.uid};
		  $("input[name=faidss]:checked").each(function(){
			  value.push($(this).val());
			  
		  })
		  if(value.length==0){
	     	alert("您没有选中任何内容哦");
		  }else{
			  if(confirm("确定移出吗")==true){
				  $.ajax({
					  url:"/Email/email/yichu2.action?value="+value+"&id="+id+"&uid="+uid+"",
					  type:"post",
					  success:function(rs){
						  if(rs==1){
							  alert("该信息已在此文件夹里哦");
						  }else{
							  alert("移入新文件夹成功");
							  p(1,3);
								pp();
								ppp();
								ojbk();
							  
						  }
					  }
				  })
			  }
		  }
	  
  })



  $("#sjyidu").click(function(){
	  var value=[];
	  var id=${user.uid};
	  $("input[name=faidss]:checked").each(function(){
		  value.push($(this).val());
		  
	  })
	  
	 
	  if(value.length==0){
			 alert("您没有选中任何内容哦");
	  }else{
		  if(confirm("确定标记为已读吗")==true){
			  $.ajax({
				  url:"/Email/email/yidu.action?value="+value+"&uid="+id+"",
				  type:"post",
			     success:function(rs){
			    	 if(rs==1){
			    		 alert("该信息已是已读状态");
			    		 $("#sjqx").attr("checked",false);
			    		 $("[name=faidss]").attr("checked",false);
			    	 }else{
			    	 alert("设为已读成功");
			    	 $("#sjqx").attr("checked",false);
			    	 p(1,1);
			    	 ppp();
			    	 ojbk();
			    	 }
			     }
			  })
		  }
	  }
  })
 $("#sjweidu").click(function(){
		  var value=[];
		  var id=${user.uid};
		  $("input[name=faidss]:checked").each(function(){
			  value.push($(this).val());
			  
		  })
		 
		  if(value.length==0){
				 alert("您没有选中任何内容哦");
		  }else{
			  if(confirm("确定标记为未读吗")==true){
				  $.ajax({
					  url:"/Email/email/weidu.action?value="+value+"&uid="+id+"",
					  type:"post",
				     success:function(rs){
				    	 if(rs==1){
				    		 alert("该信息已是未读状态");
				    		 $("#sjqx").attr("checked",false);
				    		 $("[name=faidss]").attr("checked",false);
				    	 }else{
				    	 alert("设为未读成功");
				    	 $("#sjqx").attr("checked",false);
				    	 p(1,1);
				    	 ppp();
				    	 ojbk();
				    	 }
				     }
				  })
			  }
		  }
		  
	  })

function qx(){
	var y = document.getElementById("sjqx").checked;
	var x = document.getElementsByName("faidss");
	for(var i=0;i<x.length;i++){
	    x[i].checked = y;
	}
}
  function pp(){
	  var id=${user.uid};
	  $.ajax({
		  url:"/Email/email/zhuye.action",
		  type:"post",
		  data:{"uid":id},
		  success:function(rs){
			  $("#lol").html("");
			  $.each(rs,function(i,obj){
				  var str="<option value="+obj.efid+">"+obj.foldername+"</option>";
				  $("#lol").append(str);
			  })
		  }
	  })
  }
	function p(begin,size){
		 var uid=${user.uid};
		$.ajax({
			url:"/Email/email/shoujianlist.action",
			type:"post",
			data:{"begin":begin,"size":size,"uid":uid},
			success:function(rs){
				  $("#tbl").html("")
				  var ok;
				  $.each(rs.data,function(i,obj){
					  if(obj.emailstatus2==0){
						  ok="未读";
					  }else{
						  ok="已读";
					  }
					  $("#tbl").append("<tr><td><input type='checkbox' name='faidss' value='"+obj.esid+"'></td><td>"+ok+"</td><td>"+ obj.username + "</td><td>"+ obj.title + "</td><td>"+ obj.senddate + "</td></tr>");		
					  
				  })
				  $("#one").attr("onclick","p(1,1)");
	              $("#two").attr("onclick","p("+rs.prev+",1)");
	              $("#three").attr("onclick","p("+rs.next+",1)");
	              $("#four").attr("onclick","p("+rs.totalpage+",1)");
			}
		})
		
	}
	function ppp(){
		var id=${efid};
		var uid=${user.uid};
		var count=${count2};
	    $("#weidu").html("");
		$.ajax({
			url:"/Email/email/weiduu.action",
			type:"post",
			data:{"efid":id,"uid":uid},
			success:function(rs){
				$("#weidu").append("<h4>共"+count+"条消息("+rs+")条消息未读</h4>");
			}
		})
	}
	$(function(){
		p(1,1);
		pp();
		ppp();
	})
</script>
</html>