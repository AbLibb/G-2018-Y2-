<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>辣鸡箱</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
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
						<div class="col-md-3 col-md-push-9">
							<button type="button" class="btn btn-danger" id="fjshanchu">彻底删除</button>&nbsp;
							移至<select id="lol"></select>
							<button type="button" class="btn btn-info" id="fjhuifu">恢&nbsp;&nbsp;&nbsp;&nbsp;复</button>
						</div>
					</div>
					<table class="table table-condensed table-hover table-bordered">
						<thead>
							<tr>
								<th><input type='checkbox' id="fjqx" onclick="qx()">全选</th>
								<th>发件人</th>
								<th>主题</th>
								<th>发送时间</th>
							</tr>
						</thead>
						<tbody id="tbl">

						</tbody>
					</table>
					<div align="center">
					<ul id="fjfy" class="pagination">
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
<script>
  $("#fjshanchu").click(function(){
	  var value=[];
	  var uid=${user.uid};
	  $("input[name=faidss]:checked").each(function(){
		  value.push($(this).val());
		    })
		    if(value.length==0){
				  alert("您没有选中任何内容哦");
			  }else{
				  if(confirm("确定彻底删除吗")==true){
					  $.ajax({
						  url:"/Email/email/del.action?value="+value+"",
						  type:"post",
						  success:function(rs){
							  alert("删除成功");
							     i(1,1);
								 ii();
								 ojbk();
						  }
					  })
				  }
			  }
  })
  $("#fjhuifu").click(function(){
	  var id=$("#lol").val();
	  alert(id);
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
					  url:"/Email/email/yichu.action?value="+value+"&id="+id+"&uid="+uid+"",
					  type:"post",
					  success:function(rs){
						  if(rs==1){
							  alert("该信息已在此文件夹里哦");
						  }else{
							  alert("移入新文件夹成功");
							 i(1,1);
							 ii();
							 ojbk();
							  
						  }
					  }
				  })
			  }
		  }
	  
  })
  function ii(){
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
  function qx(){
	var y = document.getElementById("fjqx").checked;
	var x = document.getElementsByName("faidss");
	for(var i=0;i<x.length;i++){
	    x[i].checked = y;
	}
}
   function i(begin,size){
	   var uid=${user.uid};

          $.ajax({
        	  url:"/Email/email/dolajilist.action",
        	  type:"post",
        	  data:{"uid":uid,"begin":begin,"size":size},
        	  success:function(rs){
        		  $("#tbl").html("");
        		$.each(rs.data,function(i,obj){
        			 $("#tbl").append("<tr><td><input type='checkbox' name='faidss' value='"+obj.esid+"'></td><td>"+ obj.username + "</td><td>"+ obj.title + "</td><td>"+ obj.senddate + "</td></tr>");		
        		
        		})
        		 $("#one").attr("onclick","i(1,1)");
	              $("#two").attr("onclick","i("+rs.prev+",1)");
	              $("#three").attr("onclick","i("+rs.next+",1)");
	              $("#four").attr("onclick","i("+rs.totalpage+",1)");
        	  }
          })
	  
   }
  $(function(){
	  i(1,1);
	  ii();
  })

</script>
</html>