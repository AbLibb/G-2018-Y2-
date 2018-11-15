<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<title>收件</title>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="table-responsive">
					<div class="col-md-12">
						<div class="form-group form-horizontal">
							<span class="col-md-2 text-center">主题:</span>
							<div class="col-md-4">
								<input type="text" class="form-control" />
							</div>
							<span class="col-md-2 text-center">发件人：</span>
							<div class="col-md-4">
								<input type="text" class="form-control" />
							</div>
						</div>

						<div class="form-group form-horizontal">
							
							<span class="col-md-2 text-center">发送时间：</span>
							<div class="col-md-6">
								<input type="date" />至
								<input type="date"/>
							</div>
							<div class="col-md-4">
								<button type="button" class="btn btn-info">立即查找</button>&nbsp;
								<button type="button" class="btn btn-info">清除</button>
							</div>
						</div>
					</div>
					<div class="col-md-12">
					<br/>
						<div class="col-md-2 col-md-push-10">
							<button type="button" class="btn btn-info" id="fayichu">移&nbsp;&nbsp;&nbsp;&nbsp;除</button>
						</div>
					</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr align="center">
								<th><input type='checkbox' id="faqx" onclick="qx()">全选</th>
								<th>收件人</th>
								<th>主题</th>
								<th>发送时间</th>
								<th colspan="2">操作</th>
							</tr>
						</thead>
						<tbody id="tbl">

						</tbody>
					</table>
					<div align="center">
					<ul id="fafy" class="pagination">
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
   $(function(){
	  query(1,3);
	 
   })
   $("#fayichu").click(function(){
	  var value=[];
	  var uid=${user.uid};
	  
	  $("input[name=faids]:checked").each(function(){
		  value.push($(this).val());
		  
	  })
	 if(value.length==0){
		 fnShowAlert("您没有选中任何内容哦");
	 }else{
		  if(confirm("确定移入辣鸡箱吗")==true){
			   $.ajax({
				  url:"/Email/email/belajis.action?value="+value+"&uid="+uid+"",
				
				  type:"post",
				  success:function(rs){
					  
					  if(rs==0){
					  alert("已全部移入辣鸡箱");
					  $("#faqx").attr("checked",false);
					  query(1,3);
					  ojbk();
				  }else{
					  alert("有邮件已被读取不能撤回");
					  $("#faqx").attr("checked",false);
					  $("[name=faids]").attr("checked",false);
				  }
					  
				  }
			   });
		   }
	 }
   })
	function qx(){
		var y = document.getElementById("faqx").checked;
		var x = document.getElementsByName("faids");
		for(var i=0;i<x.length;i++){
		    x[i].checked = y;
		}
	}
  function query(begin,size){
	   var id=${uid};
	   var fid=${fid};
	   $.ajax({
		   url:"/Email/email/fajianlist.action",
		   type:"post",
		   data:{"uid":id,"fid":fid,"begin":begin,"size":size},
		   success:function(rs){
			   $("#tbl").html("");
			  $.each(rs.data,function(i,obj){
				  $("#tbl").append("<tr><td><input type='checkbox' name='faids' value='"+obj.esid+"'></td><td>"+ obj.username + "</td><td>"+ obj.title + "</td><td>"+ obj.senddate + "</td><td><a href='#' name='fack' data-fack='"+obj.esid+"'><span class='glyphicon glyphicon-search' aria-hidden='true'></span>查看</a></td><td><a href='javascript:void(0)'onclick='shanchu("+obj.esid+")' name='fach' data-fach=''><span class='glyphicon glyphicon-retweet' aria-hidden='true'></span>撤回</a></td></tr>");		
				  
			  })
			  $("#one").attr("onclick","query(1)");
              $("#two").attr("onclick","query("+rs.prev+")");
              $("#three").attr("onclick","query("+rs.next+")");
              $("#four").attr("onclick","query("+rs.totalpage+")");
		   }
		   
	   })
   }
   function shanchu(esid){
	  var id=esid;
      var uid=${user.uid};
	   if(confirm("确定移入辣鸡箱吗")==true){
		   $.ajax({
			  url:"/Email/email/belaji.action",
			  type:"post",
			  data:{"esid":id,"uid":uid},
			  success:function(rs){
				  if(rs==0){
				  alert("已移入辣鸡箱");
				  query(1,3);
				  ojbk();
				  }else{
					  alert("该邮件已被读取不能撤回");
				  }
			  }
		   
		   });
	   }
   }

</script>
</html>