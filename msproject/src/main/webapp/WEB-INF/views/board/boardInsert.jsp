<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<c:if test="${sessionScope.loginUser == null }">
	<script>
		alert("로그인 하신 후 사용하세요.");
		location.href="${path}/boardList.ms?message=nologin";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<title>게시글 작성</title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Sunflower:300');
	.viewBody{
		margin:0;
		padding: 0;
		font-family: 'Nanum Gothic Coding', monospace;
		font-weight: bold;
	}
</style>
<body>
	<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<div class="viewBody" style="width: 850px;height: ;margin: 80px auto 100px; background-color: white; border: 1.5px solid black; border-radius: 10px; padding: 20px">
		<form action="insertPlay.ms" id="frm_body" method="post" enctype="multipart/form-data">
		<div><h3 style="font-size: 35px; margin: 10px 0px 20px; font-weight: bold;">게시글 작성</h3></div>
		<div style="width: 800px; margin:0 auto; border-radius: 10px 10px 0px 0px; overflow: hidden;">
			<div style="height: 40px; width: 100%; color: white; background-color:#747474; border-bottom: 1px solid lightgray">
				<span style="margin: 0 20px; font-size: 20px;">TITLE</span>
				<input id="title" name="title" type="text" name="" placeholder="제목을 입력해주세요" style="padding-left: 10px;width:86%; height: 30px;margin-top: 5px; border: none; outline: none; font-size: 15px; border-radius: 5px; color: black;">
			</div>
			<div style="font-size: 15px">
				<div style="padding: 10px 20px;background-color:#747474;color: white;">CONTENT<span style="float: right;margin-left: 10px;">${sessionScope.loginUser.id}</span><span style="float: right;">WRITER</span></div>
				<div style="padding: 10px; border: 1px solid #747474">
					<textarea id="contentInsert" name="content" style="width: 100%; height:500px; box-sizing: border-box; resize: none; border: none"></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef: oEditors,
						 	elPlaceHolder: "contentInsert",
						 	sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
						 	fCreator: "createSEditor2"
						});
					</script>
				</div>
			</div>
			<div style="width: 100%; height: 50px; border: 1px solid #747474; border-top: none; box-sizing: border-box; display: flex; align-items: center;">
				<div style="width:50%; margin-left: 10px;">
					<input id="uploadfile" type="file" name="uploadfile" style="">
					<input id="btn-file" type="button" value="파일선택">
					<span id="file_name" style="display: inline-block">선택된 파일 없음</span>(<span id="now-file-size">0mb</span>)
					<i class="fas fa-times" id="close_btn" style="display:none"></i>				
				</div>
				<div style="width:50%; margin-right: 10px;"><span id="frm_btn" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; float: right; color: white; user-select:none; cursor: pointer">SUBMIT</span></div>
			</div>
		</div>
		<input name="writer" type="hidden" value="${sessionScope.loginUser.id}">
		</form>
	</div>
	<script type="text/javascript">
	
		$(document).ready(function(){
			$('#frm_btn').click(function(){
				oEditors.getById["contentInsert"].exec("UPDATE_CONTENTS_FIELD",[]);
				var title = $.trim($("#title").val());
				var content = $("#contentInsert").val();
				if(title == ""){
					alert('제목이 있어야 합니다.');
					return false;
				}
				if(content=="<p><br></p>"){
					alert('내용이 있어야 합니다.');
					return false;
				}
				$('#frm_body').submit();
			});
			$(document).on('click','#btn-file',function(){
				$('#uploadfile').click();
			});
			$(document).on('change','#uploadfile',function(){
				var filesize = $(this)[0].files;
				if(filesize.length<1){
					$("#file_name").text("선택된 파일 없음");
					$("#close_btn").css("display","none");
				}else{
					var filename = this.files[0].name;
					var size = this.files[0].size;
					var maxSize = 10*1024*1024;
					
					if(size>maxSize){
						alert("첨부파일 사이즈는 10mb 이내로 등록가능합니다.");
						$("#file_name").text("선택된 파일 없음");
						$("#uploadfile").val("");
						$("#now-file-size").text("0mb");
					}else{
						var formSize = size/((1024*1024))
						$("#file_name").text(filename);
						$("#close_btn").css("display","inline-block");
						$("#now-file-size").text(formSize.toFixed(1)+"mb");
					}
				}
			});
			$(document).on('click','#close_btn',function(){
				$("#uploadfile").replaceWith($("#uploadfile").clone(true));
				$("#uploadfile").val("");
				$("#file_name").text("선택된 파일 없음");
				$("#close_btn").css("display","none");
				$("#now-file-size").text("0mb");
			});
		});
	</script>
</body>
</html>