<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div>
	<label class="shou_la">垃圾箱</label>(共 <label id="count_shan" class="text-danger"></label> 封)
</div>
<table class="table" id="message-index-ll" style="margin-top:2rem;">
  <thead>
  	<tr>
  		<td><input type="checkbox" name="one" ></td>
  		<td>状态</td>
  		<td>发件人</td>
  		<td colspan="3">主题</td>
  		<td>时间</td>

  	</tr>
  </thead>
  <tbody class="list-All_Gc">


  </tbody>
</table>
<table class="table">
	<tbody>

		<nav>
  <ul class="pagination">
  	<li>
  		<a href="javascript:void(0)" aria-label="Previous" name="deleteAll">
        <span aria-hidden="true" >彻底删除</span>
      </a>
  	</li>

   <li>
      <a href="javascript:void(0)" aria-label="Previous" name="next">
        <span aria-hidden="true" >上一页</span>
      </a>
    </li>
    <li>
      <a href="javascript:void(0)" aria-label="Next" name="prev">
        <span aria-hidden="true" >下一页</span>
      </a>
    </li> 
  	<li>
  		<a href="javascript:void(0)" aria-label="Previous" >
        <span aria-hidden="true" >恢复到
        <select class="ddd_2">
        </select></span>
      </a>
  	</li>
    <li>
      <a href="javascript:void(0)" aria-label="Next" >
        <span aria-hidden="true" >全文搜索：<input type="text" placeholder="邮件全文搜索... " name="wheres"></span>
      </a>
    </li>
  </ul>
</nav>
	</tbody>
</table>
<!-- 消息提示框 -->
		<div id="alertDialog4" class="modal fade" data-backdrop="static" data-keyboard="false" ">
			<div class="modal-dialog modal-sm" style="width: 50rem;">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h6 class="modal-title"></h6>
					</div>
					<div class="modal-body" style="height:10rem;">
						<div class="form-group form-horizontal input1">
							<span class="col-md-3 text-center">文件夹名称：</span>
							<div class="col-md-6">
								<input type="text" class="form-control" id="number" placeholder="请输入文件夹名称"/>
								<br />
								<label class="text-danger" id="messageNumber"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>
		
		<div id="alertDialog3" class="modal fade" data-backdrop="static" data-keyboard="false" ">
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
		Gc(1,2,"");
		LoadFile();
		ShanCount();
		count();
	})
	$(".list-All_Gc").on("click",".info_gc",function(){
		var id = $(this).find("input").val();
		alert(id)
	});
	//删除
	$("[name=delete]").click(function(){
		GC_delete();
	});
	$("[name=deleteAll]").click(function(){
		
	});
	$("[name=yidu]").click(function(){
		yidu();
	});
	$("[name=weidu]").click(function(){
		weidu();
	});
	$("[name=one]").click(function(){
		if(this.checked){
			 $("[name=two]").prop("checked",true);
		}else{
			 $("[name=two]").prop("checked",false);
		}
			 
	});
	$("[name=wheres]").blur(function(){
		Gc(1,2,this.value);
	});
	$(".ddd_2").on("change",function(){
		var selectName = $(this).val();
		
		var optionVal = $(this).val();

		if(selectName=='自定义文件夹'){
			fnShowAlert4(selectName);
		}else{
			 var chk_value = [];//定义一个数组
		        //利用将name等于ids的多选按钮得到
		        $("input[name='two']:checked").each(function() {
		        //将选中额数据存到数组里
		        chk_value.push($(this).val());
		        });
		        if (chk_value.length == 0) {
		        	fnShowAlert3("你还没有选择任何内容！");
		        	return;
		        }
		        if (chk_value.length > 0) {
		        	fnShowAlert3("添加成功！");
		        	$.ajax({
    					url:"/Email/Home/MoveFolder?chk_value=" + chk_value+"&efid="+optionVal,
    					type:"post",
    					success: function(json){
    						count();
    						fnShowAlert3("修改成功！");
    						Gc(1,2);
    					}
    				});
		        }
		}
	});
	//加载下拉框
	function LoadFile(){
		$.get("/Email/Home/showEmailFile","",function(data){
			$(".ddd_2").html("");
			$(".ddd_2").append("<option>---请选择---</option>");
			$.each(data,function(){
				
				var $option = '<option value='+this.efid+'>'+this.foldername+'</option>';
				$(".ddd_2").append($option);
				
			});
			$(".ddd_2").append("<option>-----------------</option>");
			$(".ddd_2").append("<option class='xinjian'>自定义文件夹</option>");
		});
	}
	//删除
	function GC_delete() {
        var chk_value = [];//定义一个数组
        //利用将name等于ids的多选按钮得到
        $("input[name='two']:checked").each(function() {
        //将选中额数据存到数组里
        chk_value.push($(this).val());
        });
        if (chk_value.length == 0) {
        	fnShowAlert3("你还没有选择任何内容！");
        	return;
        }
        if (chk_value.length > 0) {
        	$.ajax({
        		url:"/Email/Home/delete?chk_value=" + chk_value,
        		type:"post",
        		success: function(json){
        			
        			fnShowAlert3("已添加到垃圾箱！");
        			Gc(1,2);
        			count();
        		}
        	})
        }
	}
	
	//显示提示框
	function fnShowAlert4(msg) {
		//模态框信息
		$("#alertDialog4").find(".modal-content h6").text(msg);
		$("#alertDialog4").modal(); //显示
	
	}
	function fnShowAlert3(msg) {
		//模态框信息
		$("#alertDialog3").find(".modal-content h6").text(msg);
		$("#alertDialog3").modal(); //显示
	
	}
	function ShanCount(){
		$.get("/Email/Home/yiduss",{"efid":5},function(data){
			$("#count_shan").text(data);
		});
	}

	function Gc(begin,size,title){
		//提交
		$(".list-All_Gc").html("");
		$.ajax("/Email/Home/GetPage", {
			type: "POST",
			data: {
				"begin": begin,
				"size": size,
				"title":title,
				"efid":5
			},
			success: function(json) {
				console.log(json)
				if(json.data==""){
					var $div = '<tr>\
									<td colspan=4 style=width:60rem;height:20rem;>\
										<div class=text-center style=margin-top:8rem;>\
											<lable >没有数据了</lable>\
										</div>\
									</td>\
								</td>';
					$(".list-All_Gc").append($div);
				}
				$.each(json.data,function(i,obj){
					
					$.each(obj.eemailList,function(i,dd){
						if(obj.emailstatus==1){
							if(obj.scicemail==1){
								$tr = "<tr class='info_gc'><td><input type='checkbox' value="+obj.erid+" name='two'></td><td><lable class='text-danger'>未读</lable></td><td>******</td><td  colspan='3'>"+dd.title+"</td>\<td>"+obj.readdate+"</td>\</tr>";
								$(".list-All_Gc").append($tr);
							}else{
								$tr = "<tr class='info_gc'><td><input type='checkbox' value="+obj.erid+" name='two'></td><td><lable class='text-danger'>未读</lable></td><td>"+obj.euser.uname+"</td><td  colspan='3'>"+dd.title+"</td>\<td>"+obj.readdate+"</td>\</tr>";
								$(".list-All_Gc").append($tr);
							}
							
						}else{
							if(obj.scicemail!=1){
								$tr = "<tr class='info_gc'><td><input type='checkbox' value="+obj.erid+" name='two'></td><td><lable class='text-danger'>已读</lable></td><td>"+obj.euser.uname+"</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
								$(".list-All_Gc").append($tr);
							}else{
								$tr = "<tr class='info_gc'><td><input type='checkbox' value="+obj.erid+" name='two'></td><td><lable class='text-danger'>已读</lable></td><td>******</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
								$(".list-All_Gc").append($tr);
							}
						}
					})
				})
				$("[name=next]").attr("onclick","Gc("+json.prev+",2,'"+title+"')");
                $("[name=prev]").attr("onclick","Gc("+json.next+",2,'"+title+"')");
			}
		});
	}
</script>