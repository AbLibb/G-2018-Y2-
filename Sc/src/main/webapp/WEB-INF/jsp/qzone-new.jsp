<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath }/">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			*{
				margin:0px;
				padding:0px;
			}
			.title{
				/*margin:*/
				padding:5px 8px;
				display: flex;
				justify-content: space-between;
				border-bottom: 1px solid #F0F0F0;
			}
			.title div:nth-child(2){
				background-color: #F0F0F0;
				padding: 5px 15px;
				border-radius: 3px;
			}
			textarea{
				margin:5px 8px;
				border:0px;
				width:90%;
				height:5em;
			}
			textarea:focus{
				outline:none;
			}
			.file-buttom input{
				opacity: 0;
				position:absolute;
				width:5em;
				margin:5px 8px;
				height:5em;
				top:0px;
				left:0px;
			}
			.file-buttom div{
				width:5em;
				margin:5px 8px;
				height:5em;
				background-color: #f2f2f2;
				text-align: center;
				border-radius: 5px;
			}
			.file-buttom{
				position: relative;
			}
			div img{
				/*background-image: url(img/1.png);*/
				width:2em;
				height: 2em;
			}
		</style>
		<script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".qzoneNew").click(function(){
					$("form").submit();
				});
			})
		</script>
	</head>
	<body>
		<form action="fileUpload" method="post" enctype="multipart/form-data">
		<div>
			<div class="title">
				<div>取消</div>
				<div class="qzoneNew">发表</div>
			</div>
			<div>
				<textarea name="content">这是文本</textarea>
			</div>
			<div class="file-buttom">
				<div>
					<img src="static/fileUpload/">
					<br>
					选择图片
				</div>
				<input type="file" multiple name="files">
			</div>
		</div>
		</form>
	</body>
</html>
