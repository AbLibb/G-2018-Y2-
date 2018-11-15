<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div>
	<label class="shou_la">发信箱</label>(共 <label id="count_fa" class="text-danger"></label> 封)
</div>
<table class="table" id="message-index-ll" style="margin-top:2rem;">
  <thead>
  	<tr>
  		<td><input type="checkbox" name="one" ></td>
  		
  		<td>发件人</td>
  		<td>主题</td>
  		<td colspan="3">内容</td>
  		<td>时间</td>

  	</tr>
  </thead>
  <tbody class="list-All_fa">


  </tbody>
</table>
<table class="table">
	<tbody>

		<nav>
  <ul class="pagination">
  	<li>
  		<a href="javascript:void(0)" aria-label="Previous" name="delete">
        <span aria-hidden="true" >删除</span>
      </a>
  	</li>
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
  	<li class="lis">
  		<a href="javascript:void(0)" aria-label="Previous" >
        <span aria-hidden="true" >移动到
        <select class="ddd_3">
        	
        	
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
		<div id="tongzhi" class="modal fade" data-backdrop="static" data-keyboard="false" ">
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
								<input type="text" class="form-control" id="wenjianjia" placeholder="请输入文件夹名称"/>
								<br />
								<label class="text-danger" id="messageWenjianjia"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary"   onclick="submits_fa()">确认</button>
					</div>
				</div>
			</div>
		</div>
		
		<div id="text_message" class="modal fade" data-backdrop="static" data-keyboard="false" ">
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
		Page_fa(1,2,"");
		LoadFile();
		FaCount();
		count();
	})
	//删除
	$("[name=delete]").click(function(){
		todelect();
	});
	$("[name=deleteAll]").click(function(){
		
	});
	$("[name=one]").click(function(){
		if(this.checked){
			 $("[name=two]").prop("checked",true);
		}else{
			 $("[name=two]").prop("checked",false);
		}
			 
	});
	$("[name=wheres]").blur(function(){
		Page_fa(1,2,this.value);
	});
	$(".ddd_3").on("change",function(){
		var selectName = $(this).val();
		var optionVal = $(this).val();
		if(selectName=='自定义文件夹'){
			fnShowAlert(selectName);
		}else{
			 var chk_value = [];//定义一个数组
		        //利用将name等于ids的多选按钮得到
		        $("input[name='two']:checked").each(function() {
		        //将选中额数据存到数组里
		        chk_value.push($(this).val());
		        });
		        if (chk_value.length == 0) {
		        	fnShowAlert1("你还没有选择任何内容！");
		        }
		        if (chk_value.length >= 1) {
		        	$.ajax({
    					url:"/Email/Home/MoveFolder?chk_value=" + chk_value+"&efid="+optionVal,
    					type:"post",
    					success: function(json){
    						count();
    			        	fnShowAlert1("添加成功！");
    						Page(1,2);
    					}
    			});
		    }
		}
	});
	//加载下拉框
	function LoadFile(){
		$.get("/Email/Home/showEmailFile","",function(data){
			$(".ddd_3").html("");
			$(".ddd_3").append("<option>---请选择---</option>");
			$.each(data,function(){
				if(this.euid!=null){
				var $option = '<option value='+this.efid+'>'+this.foldername+'</option>';
				$(".ddd_3").append($option);
				}
			});
			$(".ddd_3").append("<option>-----------------</option>");
			$(".ddd_3").append("<option class='xinjian'>自定义文件夹</option>");
		});
	}
	//删除
	function todelect() {
        var chk_value = [];//定义一个数组
        //利用将name等于ids的多选按钮得到
        $("input[name='two']:checked").each(function() {
        //将选中额数据存到数组里
        chk_value.push($(this).val());
        });
        if (chk_value.length == 0) {
        	fnShowAlert1("你还没有选择任何内容！");
        }
        if (chk_value.length > 0) {
        	$.ajax({
        		url:"/Email/Home/delete?chk_value=" + chk_value,
        		type:"post",
        		success: function(json){
        			fnShowAlert1("已添加到垃圾箱！");
        			Page_fa(1,2)
        		}
        	})
        }
	}
	//新建用户私人文件夹
	function submits_fa(){
		var wen = $("#wenjianjia").val();
		if(wen==""){
			$("#messageWenjianjia").text("不能为空！");
			return;
		}
		$.ajax({
			url:"/Email/Home/insertFolder",
			type:"post",
			data:{"foldername":wen},
			success: function(json){
    			fnShowAlert1("新建成功！");
    			showEmailFile();
    		}
		})
		$("#tongzhi").modal('hide');
	}
	

	//显示提示框
	function fnShowAlert(msg) {
		//模态框信息
		$("#tongzhi").find(".modal-content h6").text(msg);
		$("#tongzhi").modal(); //显示
	
	}
	function fnShowAlert1(msg) {
		//模态框信息
		$("#text_message").find(".modal-content h6").text(msg);
		$("#text_message").modal(); //显示
	
	}
	function FaCount(){
		$.get("/Email/Home/yiduss",{"efid":4},function(data){
			$("#count_fa").text(data);
		});
	}
	function Page_fa(begin,size,title){
		//提交
		$(".list-All_fa").html("");
		$.ajax("/Email/Home/GetPage", {
			type: "POST",
			data: {
				"begin": begin,
				"size": size,
				"title":title,
				"efid":4
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
					$(".list-All_fa").append($div);
				}
					$.each(json.data,function(i,obj){
						
						$.each(obj.eemailList,function(i,dd){
							var $tr;
							if(obj.emailstatus==0){
								if(obj.scicemail==1){
									$tr = "<tr><td><input type='checkbox' value="+obj.erid+" name='two'></td><td>******</td><td>"+dd.title+"</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
									$(".list-All_fa").append($tr);
								}else{
									$tr = "<tr><td><input type='checkbox' value="+obj.erid+" name='two'></td><td>"+obj.euser.uname+"</td><td>"+dd.title+"</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
									$(".list-All_fa").append($tr);
								}
							}else{
								if(obj.scicemail!=1){
									$tr = "<tr><td><input type='checkbox' value="+obj.erid+" name='two'></td><td>"+obj.euser.uname+"</td><td>"+dd.title+"</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
									$(".list-All_fa").append($tr);
								}else{
									$tr = "<tr><td><input type='checkbox' value="+obj.erid+" name='two'></td><td>******</td><td>"+dd.title+"</td><td  colspan='3'>"+dd.content+"</td>\<td>"+obj.readdate+"</td>\</tr>";
									$(".list-All_fa").append($tr);
								}
							}
						})
					})
			
			   	
				 $("[name=next]").attr("onclick","Page_fa("+json.prev+",2,'"+title+"')");
                 $("[name=prev]").attr("onclick","Page_fa("+json.next+",2,'"+title+"')");
		}
		});
	}
</script>