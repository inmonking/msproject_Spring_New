<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String referer = request.getHeader("referer");
%>
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
	.fullheart{
		display: none;
	}
	.heart_ico{
		transition: 0.2s;
	}
	.heart_ico:hover{
		transform: scale(1.2);
	}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<script type="text/javascript" src="${path}/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
	<div class="viewBody" style="width: 850px;margin: 80px auto 0px; background-color: white; border: 1.5px solid black; border-radius: 10px; padding: 20px">
		<div><h3 style="font-size: 35px; margin: 10px 0px 20px; font-weight: bold;">게시글 조회</h3></div>
		<div style="width: 840px; margin:0 auto; border-radius: 5px 5px 0px 0px; overflow: hidden;">
			<div style="height: 40px; width: 100%; color: white; background-color:#747474; border-bottom: 1px solid lightgray">
				<span style="margin: 0 20px; font-size: 20px;">TITLE</span>
				<div name="" style="display: inline-block;padding-left: 10px;width:86%;margin-top: 10px; border: none; outline: none; font-size: 15px; border-radius: 5px; color: white;">${one.title}</div>
			</div>
			<div style="font-size: 15px">
				<div style="padding: 10px 20px;background-color:#747474;color: white;">
					<span>작성자</span><span style="margin-left: 10px;">${one.writer}</span>
					<span style="float: right; font-size: 10px; line-height: 25px; display: flex; flex-direction: column; margin-top: -9px">
					<fmt:formatDate value="${one.regdate }" pattern="yyyy년 MM월 dd일" var="regdate"/>
						<span style="font-size: 14px">${regdate}</span>
						<span style="margin-top: -8px; text-align: right;">
							<span>조회</span><span>${one.viewcnt }</span>
							<span>추천</span><span id="GoodCnt">${one.goodcnt }</span>
						</span>
					</span>
					</div>
				<div style="padding: 10px; border: 1px solid #747474">
					<div style="width: 100%; min-height: 200px; box-sizing: border-box; border: none">${one.content }</div>
					<div style="width: 100%; font-size: 12px; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;margin: 10px 0; padding-bottom: 10px;">
						첨부 파일
						<ul style="font-size: 10px; margin: 5px 20px 0px;">
						<c:choose>
							<c:when test="${one.filesize > 0}">
								<fmt:formatNumber var="filesize" value="${one.filesize/(1024*1024)}" pattern="0.00"/>
									<li><a href="download.ms?file=${one.filename}">${one.filename}/(${filesize}mb) </a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<li>첨부파일 없음</li>
							</c:otherwise>
						</c:choose>
					</div>
					<div style="width: 100%; text-align: center; font-size: 20px;">
					<c:if test="${!empty sessionScope.loginUser }">
						<div style="border: 1px solid #747474; display: inline-block; border-radius: 50px; width: 40px; height: 40px; display: flex;justify-content: center;line-height: 45px; margin: 0 auto">
							<span class="fullheart heart_ico"><i class="fas fa-heart"></i></span><span class="emptyheart heart_ico"><i class="far fa-heart"></i></span>
						</div>
					</c:if>
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 50px; border: 1px solid #747474; border-top: none; box-sizing: border-box; display: flex; align-items: center;">
				<div style="width:50%; margin-left: 10px;">
					<span id="returnGo" class="btnP" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; color: white">목록으로</span>
				</div>
				<div style="width:50%; margin-right: 10px; text-align: right;">
				
				<c:if test="${sessionScope.loginUser.id == one.writer}">
					<span class="btnP" id="updateBtn" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; color: white">수정</span>
					<span class="btnP" id="deleteBtn" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; color: white">삭제</span>
				</c:if>
					<span id="board_insert" class="btnP" style="background-color: #747474;text-align: center;padding: 8px; border-radius: 10px; color: white">글쓰기</span>
				</div>
			</div>
		</div>
	</div>
	<div id="reply_wrap">
		<div id="commentList">
			
		</div>
	</div>
	<script type="text/javascript">
	/* history.pushState(null,null,location.href);
	window.onpopstate = function(){
		history.go(1);
	}; 뒤로가기 막기*/
	history.pushState(null,document.title,location.href);
	window.addEventListener('popstate',function(event){
		history.pushState(null,document.title,'<%=referer%>');
		location.reload();		
	});
	
		$(document).ready(function() {
			comment_list();
			goodInfo();
			$(document).on('click', '#replyBtn', function(event) {
				oEditors.getById["replyInsert"].exec("UPDATE_CONTENTS_FIELD",[]);
				var content = $("#replyInsert").val();
				if(content=="<p><br></p>"){
					$(".se2_inputarea").focus();
					return false;
				}else{
					
					var bno = '${one.bno}';
					$('#re_bno').val(bno);
					
					$.ajax({
						type: "post",
						url: "replyAdd.ms",
						data: $("#frm_reply").serialize(), //직렬화
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success: function(){
							comment_list();
							$("#replyInsert").val("");
						},
						error: function(){
							alert("System error");
						}
					});
				}
			});
			$('#board_insert').click(function(event) {
				$.ajax({
					type: "post",
					dataType: "json",
					url: "${path}/registerAjax.ms",
					success: function(data){
						if(data.message == "login"){
							location.href = "${path}/boardInsert.ms";							
						}else{
							$("#modal_login").css("display","flex");
							$('#err_check_msg').text('로그인이 필요한 서비스 입니다.')
							.css('opacity', '1');
						}
					}
				});
			});
			$(document).on('click', '#refresh', function(event) {
				comment_list();
				goodInfo();
			});
			$('#returnGo').click(function(){
				location.href = "<%=referer%>";
			});
			$(".heart_ico").click(function(event) {
				goodSwitch();
				goodInfo();
			});
			$("#deleteBtn").click(function(){
				var flag = confirm("정말 삭제하시겠습니까?");
				if(flag){
					location.href = "${path}/delete.ms?bno=${one.bno}&filename=${one.filename}";
				}
			});
			$("#updateBtn").click(function(){
				location.href = "${path}/update.ms?bno=${one.bno}";
			});
			
			$(document).on('click', '.reply_del', function(event) {
				var rno = $(this).attr("data_num");
				var bno = '${one.bno}';
				
				$.ajax({
					url: "replyRemove.ms",
					data: "rno="+rno+"&bno="+bno,
					success: function(result){
						comment_list();
					},
					error: function(){
						alert("System Error!");
					}
				});
			});
		});
		function comment_list(){
			$.ajax({
				type: "post",
				url: "commentlist.ms",
				data: "bno=${one.bno}",
				success: function(result){
					$("#commentList").html(result);
				}
			});
		}

		function goodSwitch(){
			$.ajax({
				url: '${path}/boardSwitch.ms',
				type: 'post',
				dataType: 'json',
				async: false,
				data: "bno=${one.bno}&id=${sessionScope.loginUser.id}",
				success: function(data){
				}
			});
		}
		
		function goodInfo(){
			$.ajax({
				url: '${path}/boardGood.ms',
				type: 'post',
				dataType: 'json',
				data: "bno=${one.bno}&id=${sessionScope.loginUser.id}",
				success: function(data){
					if(data.result == "1"){
						$('.fullheart').css('display', 'block');
						$('.emptyheart').css('display', 'none');
					}else{
						$('.emptyheart').css('display', 'block');
						$('.fullheart').css('display', 'none');
					}
					$('#GoodCnt').text(data.GoodCnt);
				}
			});
		}
	</script>
</body>
</html>