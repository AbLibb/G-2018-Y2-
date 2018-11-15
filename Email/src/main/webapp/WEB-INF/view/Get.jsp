<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div>
	<label class="shou_la">收信箱</label>(共 <label class="text-danger count_s2"></label>封)
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
  <tbody class="list-All_Get">


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
  		<a href="javascript:void(0)" aria-label="Previous" name="yidu">
        <span aria-hidden="true" >标记为已读</span>
      </a>
  	</li>
  	<li>
  		<a href="javascript:void(0)" aria-label="Previous" name="weidu">
        <span aria-hidden="true" >标记为未读</span>
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
        <select class="ddd_1">
        	
        	
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
		<div id="alertDialog" class="modal fade" data-backdrop="static" data-keyboard="false" ">
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
						<button class="btn btn-primary"   onclick="submits_get()">确认</button>
					</div>
				</div>
			</div>
		</div>
		
		<div id="alertDialog1" class="modal fade" data-backdrop="static" data-keyboard="false" ">
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
		Page(1,2,"");
		weiduCount();
		LoadFile();
		count();
	})

	//删除
	$("[name=delete]").click(function(){
		todelect();
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
		Page(1,2,this.value);
	});
	$(".ddd_1").on("change",function(){
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
        						fnShowAlert1("修改成功！");
        						Page(1,2,"");
        	        			count();
        					}
        			});
		    	 }
			}
		});
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
        			Page(1,2);
        			count();
        		}
        	})
        }
	}
	//新建用户私人文件夹
	function submits_get(){
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
		$("#alertDialog").modal('hide');
	}
	//未读条数
	function weiduCount(){
		$.get("/Email/Home/shou",{"efid":3},function(data){
			$(".count_s2").text(data);
		});
	}
	//加载下拉框
	function LoadFile(){
		$.get("/Email/Home/showEmailFile","",function(data){
			$(".ddd_1").html("");
			$(".ddd_1").append("<option>---请选择---</option>");
			$.each(data,function(){
				if(this.euid!=null){
					var $option = '<option value='+this.efid+'>'+this.foldername+'</option>';
					$(".ddd_1").append($option);
				}
			});
			$(".ddd_1").append("<option>-----------------</option>");
			$(".ddd_1").append("<option class='xinjian'>自定义文件夹</option>");
		});
	}
	//全部已读
	function yidu() {
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
        		url:"/Email/Home/yidu?chk_value=" + chk_value,
        		type:"post",
        		success: function(json){
        			fnShowAlert1("已全部已读！");
        			Page(1,2,"");
        			count();
        		}
        	})
        }
	}
	//全部未读
	function weidu() {
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
        		url:"/Email/Home/weidu?chk_value=" + chk_value,
        		type:"post",
        		success: function(json){
        			Page(1,2,"");
        			fnShowAlert1("已全部未读！");
        			count();
        		}
        	})
        }
	}
	//显示提示框
	function fnShowAlert(msg) {
		//模态框信息
		$("#alertDialog").find(".modal-content h6").text(msg);
		$("#alertDialog").modal(); //显示
	
	}
	function fnShowAlert1(msg) {
		//模态框信息
		$("#alertDialog1").find(".modal-content h6").text(msg);
		$("#alertDialog1").modal(); //显示
	
	}

	function Page(begin,size,title){
		//提交
		
		$.ajax("/Email/Home/GetPage", {
			type: "POST",
			data: {
				"begin": begin,
				"size": size,
				"title":title,
				"efid":3
			},
			success: function(json) {
				console.log(json)
				$(".list-All_Get").html("");
				if(json.data==""){
					var $div = '<tr>\
									<td colspan=4 style=width:60rem;height:20rem;>\
										<div class=text-center style=margin-top:8rem;>\
											<lable >没有数据了</lable>\
										</div>\
									</td>\
								</td>';
					$(".list-All_Get").append($div);
				}
					$.each(json.data,function(i,obj){
						
						$.each(obj.eemailList,function(i,dd){
							var $tr;
							if(obj.emailstatus==1){
								if(obj.scicemail==1){
									$tr = '<tr data-id="zz'+i+'" onclick="showPage(this,\'/Email/Home/info?erid='+obj.erid+'&esid='+dd.esid+'&scicemail='+obj.scicemail+'\')" class="infos"><td><input type="checkbox" value='+obj.erid+' name="two"></td><td><lable class="text-danger">未读</lable></td><td>******</td><td  colspan="3">'+dd.title+'</td>\<td>'+obj.readdate+'</td></tr>';
									$(".list-All_Get").append($tr);
								}else{
									$tr = '<tr data-id="zz'+i+'" onclick="showPage(this,\'/Email/Home/info?erid='+obj.erid+'&esid='+dd.esid+'&scicemail='+obj.scicemail+'\')" class="infos"><td><input type="checkbox" value='+obj.erid+' name="two"></td><td><lable class="text-danger">未读</lable></td><td>'+obj.euser.uname+'</td><td  colspan="3">'+dd.title+'</td>\<td>'+obj.readdate+'</td></tr>';
									$(".list-All_Get").append($tr);
								}
								
							}else{
								if(obj.scicemail!=1){
									$tr = '<tr data-id="zz'+i+'" onclick="showPage(this,\'/Email/Home/info?erid='+obj.erid+'&esid='+dd.esid+'&scicemail='+obj.scicemail+'\')" class="infos"><td><input type="checkbox" value='+obj.erid+' name="two"></td><td><lable class="text-danger">已读</lable></td><td>'+obj.euser.uname+'</td><td  colspan="3">'+dd.title+'</td>\<td>'+obj.readdate+'</td></tr>';
									$(".list-All_Get").append($tr);
								}else{
									$tr = '<tr data-id="zz'+i+'" onclick="showPage(this,\'/Email/Home/info?erid='+obj.erid+'&esid='+dd.esid+'&scicemail='+obj.scicemail+'\')" class="infos"><td><input type="checkbox" value='+obj.erid+' name="two"></td><td><lable class="text-danger">已读</lable></td><td>******</td><td  colspan="3">'+dd.title+'</td>\<td>'+obj.readdate+'</td></tr>';
									$(".list-All_Get").append($tr);
								}
							}
						})
					})
			
				
				 $("[name=next]").attr("onclick","Page("+json.prev+",2,'"+title+"')");
                 $("[name=prev]").attr("onclick","Page("+json.next+",2,'"+title+"')");
		}
		});
		
	
	}
</script>