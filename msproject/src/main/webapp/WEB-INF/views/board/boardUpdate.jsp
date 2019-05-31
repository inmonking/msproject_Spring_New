<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Sunflower:300');
	.viewBody{
		margin:0;
		padding: 0;
		font-family: 'Nanum Gothic Coding', monospace;
		font-weight: bold;
	}
	.fa-times-circle{
		color:red;
	}
	.fa-bullseye{
		color:green;
	}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<c:if test="${sessionScope.loginUser.id == one.writer }">
<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<div class="viewBody" style="width: 850px;height: ;margin: 80px auto 100px; background-color: white; border: 1.5px solid black; border-radius: 10px; padding: 20px">
		<form action="updatePlay.ms" id="frm_body" method="post" enctype="multipart/form-data">
		<div><h3 style="font-size: 35px; margin: 10px 0px 20px; font-weight: bold;">게시글 수정</h3></div>
		<div style="width: 800px; margin:0 auto; border-radius: 10px 10px 0px 0px; overflow: hidden;">
			<div style="height: 40px; width: 100%; color: white; background-color:#747474; border-bottom: 1px solid lightgray">
				<span style="margin: 0 20px; font-size: 20px;">TITLE</span>
				<input id="title" type="text" name="title" placeholder="제목을 입력해주세요" value="${one.title }" style="padding-left: 10px;width:86%; height: 30px;margin-top: 5px; border: none; outline: none; font-size: 15px; border-radius: 5px;color: black;">
			</div>
			<div style="font-size: 15px">
				<div style="padding: 10px 20px;background-color:#747474;color: white;">CONTENT<span style="float: right;margin-left: 10px;">${one.writer }</span><span style="float: right;">WRITER</span></div>
				<div style="padding: 10px; border: 1px solid #747474">
					<textarea id="contentInsert" name="content" style="width: 100%; height: 500px; box-sizing: border-box; resize: none; border: none; opacity: 0">${one.content }</textarea>
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
			<div style="width: 100%;border: 1px solid #747474; border-top: none; box-sizing: border-box; display: flex; align-items: center;">
				<div style="width:50%; margin: 10px">
				
				
					<div id="attach"><input id="btn-file" type="button" value="첨부파일" style="padding: 4px; border-radius: 5px; box-shadow: none; outline: none; border: none;">
						<span id="attachFile">
							<c:choose>
								<c:when test="${one.filesize>0}">
									<fmt:formatNumber var="filesize" value="${one.filesize/(1024*1024)}" pattern="0.00"/>
									${one.filename}(${filesize}mb)</span><span id="fileDelete" style="margin-left: 4px;"><i class="far fa-times-circle"></i></span>
								</c:when>
								<c:otherwise>첨부파일 없음</span>
								</c:otherwise>
							</c:choose>
					</div>
					<input type="file" name="uploadfile" id="uploadfile" style="display: none;">
					<input id="btn-file" type="button" value="파일선택" style="padding: 4px; border-radius: 5px; box-shadow: none; outline: none; border: none;">
					<span id="file_name" style="display: inline-block">선택된 파일 없음</span>(<span id="now-file-size">0mb</span>)
					<i class="fas fa-times" id="close_btn" style="display:none"></i>
				</div>
				<div style="width:50%; margin-right: 10px;">
					<span id="frm_btn" class="btnP" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; float: right; color: white; margin-left: 5px">수정하기</span>
					<a href="${path }/boardView.ms?bno=${one.bno}"><span style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; float: right; color: white">돌아가기</span></a>
				</div>
			</div>
		</div>
		<input name="bno" type="hidden" value="${one.bno}">
		<input name="writer" type="hidden" value="${one.writer}">
		<input name="basic_check" type="hidden" id="basic_check" value="no">
	</form>
	</div>
</c:if>
	<script type="text/javascript">
		$(document).ready(function(){
			if(${sessionScope.loginUser.id != one.writer}){
				alert('잘못된 경로 입니다');
				history.back();
			}
			var flag = true;
			if(${one.filesize>0}){
				flag = true;
			}else{
				flag = false;
				file_basic_check();
			}
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
						flag = true;
						file_basic_check();
					}
				}
			});
			
			$(document).on('click','#close_btn',function(){
				$("#uploadfile").replaceWith($("#uploadfile").clone(true));
				$("#uploadfile").val("");
				$("#file_name").text("선택된 파일 없음");
				$("#close_btn").css("display","none");
				$("#now-file-size").text("0mb");
				flag = false;
				file_basic_check();
			});
			$("#fileDelete").click(function(event) {
				file_basic_check();
			});
			function file_basic_check(){
				if(flag){
					$("#attachFile").css('color','#aaa').css('text-decoration','line-through');
					$("#fileDelete").html("<i class='fas fa-bullseye'></i><span style='color:red; user-select:none'>[파일삭제]</span>");
					$("#basic_check").val('no');
					flag = false;
				}else{
					$("#attachFile").css('color','black').css('text-decoration','none');
					$("#fileDelete").html("<i class='far fa-times-circle'></i>");
					$("#basic_check").val('yes');
					flag = true;
				}
			}
		});
	</script>
</body>
</html>