<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판 목록</title>
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Sunflower:300');
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Sunflower:300');
	a{
		font-weight: bold;
		color: black;
	}
	.viewBody{
		margin:0;
		padding: 0;
		font-family: 'Nanum Gothic Coding', monospace;
		font-weight: bold;
	}
	#board_sort > a{
		padding: 5px;
		border: 1px solid darkgray;
		font-size: 0.8em;
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
		color: black;
	}
	.board_content{
		margin: 0 auto;
		width: 1000px;
		border-collapse: collapse;
	}
	.board_content tr:nth-child(odd){
		background-color: #E4E4E4;
	}
	
	.board_content tr:hover{
		background-color: #D9D9D9;
	}

	.board_content td,th{
		border: 2px solid white;
	}
	.board_content th{
		height: 25px;
		padding: 5px;	
		background-color: #5D5D5D;
		color: white;
		font-size: 1.2em;
		text-align: center;
	}
	.board_content td{
		padding: 7px 10px;
		text-align: center;
		font-weight: bold;
	}
	.board_content td:nth-child(2){
		text-align: left;
	}
	.page_detail{
		font-family: 'Sunflower', sans-serif;
		display: inline-block;
		width: 30px;
		border: 1px solid black;
		border-radius: 5px;
		cursor: pointer;
		user-select: none;
		font-weight: bold;
		color: black;!important;
	}
	.active{
		background-color: black;
		color: white;!important;
	}
	.fa-heart{
		font-size: 10px;
		margin-right: 2px;
	}
	.board_reply_cnt{
		margin: 0px 5px;
		background-color: tomato;
		color: white;
		border-radius: 20px;
		width: 15px;
		height: 15px;
		line-height: 15px;
		text-align: center;
		display: inline-block;
		font-weight: normal;
		font-size: 0.8em;
	}
	.board_ico_new{
		width: 40px;
		display: inline-block;
		margin: 0px 5px;
		border-radius: 10px;
		background-color: orange;
		color: white;
		text-align: center;
		height: 16px;
		line-height: 16px;
		font-size: 0.8em;
		animation-name: twinkle;
		animation-duration: 2s;
		animation-iteration-count: infinite;
	}
	@keyframes twinkle{
		0% {opacity:0;}
		50% {opacity:1;}
		100% {opacity:0;}
	}
</style>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="viewBody" style="width: 1040px;height: ;margin: 80px auto 100px; background-color: white; border: 1.5px solid black; border-radius: 10px; padding: 20px">
		<div><h3 style="font-size: 35px; margin: 10px 0px 20px; font-weight: bold">게시판</h3></div>
		<div>
			<span id="board_sort">
				<a value="new" id="board_sort_new"><span>최신순</span></a>
				<a value="good" id="board_sort_good"><span>추천순</span></a>
				<a value="reply" id="board_sort_reply"><span>댓글순</span></a>
				<a value="view" id="board_sort_cnt"><span>조회순</span></a>
			</span>
			<span style="float: right;">
				<span id="board_insert" style="width: 200px; background-color: orange; border-radius: 25px; padding: 8px; color: white; font-weight: bold; font-size: 0.8em; cursor: pointer; user-select: none">게시글 등록</span>
			</span>
		</div>
		<div style="margin-top: 10px;">
			<table class="board_content">
				<tr>
					<th style="width: 50px">No.</th>
					<th style="width: 400px">제목</th>
					<th style="width: 120px">작성자</th>
					<th style="width: 130px">작성일</th>
					<th style="width: 60px">좋아요</th>
					<th style="width: 60px">조회수</th>
					<th style="width: 60px">첨부</th>
				</tr>
				<c:forEach items="${list}" var="bDto">
					<!-- 현재시간 구하기 -->
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today"/>
					<fmt:formatDate value="${bDto.regdate }" pattern="yyyy-MM-dd" var="regdate"/>
					<tr>
						<td>${bDto.bno }</td>
						<td><a href="${path }/boardView.ms?bno=${bDto.bno}"><span>${bDto.title }</span></a>
						<c:if test="${bDto.replycnt > 0 }">
							<span class="board_reply_cnt">${bDto.replycnt }</span>
						</c:if>
						<c:if test="${today==regdate}">
							<span class="board_ico_new">New</span>
						</c:if>
						</td>
						<td>${bDto.writer }</td>
						<c:choose>
							<c:when test="${today==regdate }">
								<td><fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate }"/></td>
							</c:when>
							<c:otherwise>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate }"/></td>
							</c:otherwise>
						</c:choose>
						<td><i class="fas fa-heart"></i><span>${bDto.goodcnt }<span></td>
						<td>${bDto.viewcnt }</td>
						<td>
							<c:if test="${bDto.filename != '-' && !empty bDto.filename}"><i class="far fa-save"></i></c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="height: 29px;margin-top: 10px">
			<div style="display: flex; float: right;">
				<select id="selsearch" style="height: 29px; width: 100px; border-radius: 20px;border: 1px solid lightgray; outline:none; box-sizing: border-box; font-weight: bold; user-select: none;">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
					<option value="4">작성자</option>
				</select>
				<input id="search_board" style="border-radius: 20px;height: 29px; width: 200px; border: 1px solid lightgray; outline:none; padding-left: 8px; box-sizing: border-box; margin-left: 10px; font-weight: bold" type="text" name="" placeholder="검색할 값을 입력하세요.">
				<span id="search_btn" style="height: 29px; width: 60px; background-color: orange; line-height: 29px; text-align: center; border-radius: 20px; color: white;margin-left: 10px;font-weight: bold; user-select: none; cursor: pointer;">검색</span>
			</div>
		</div>
		<div class="page_num" style="text-align: center; margin-top: 10px">
			<c:if test="${pageMaker.prev }">
				<a onclick="movePage(${pageMaker.criDto.page-5})">
					<span class="page_detail">&laquo;</span>
				</a>
				<a onclick="movePage(1)">
					<span class="page_detail">1</span>
				</a>
				<a>
					<span class="page_detail">...</span>
				</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<a onclick="movePage(${idx})"><span class="page_detail <c:out value="${pageMaker.criDto.page == idx ? 'active':'' }"/>">${idx}</span></a>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<a><span class="page_detail">...</span></a>
				<a onclick="movePage(${pageMaker.finalPage})">
					<span class="page_detail">${pageMaker.finalPage}</span>
				</a>
				<a onclick="movePage(${pageMaker.criDto.page+5})">
					<span class="page_detail">&raquo;</span>
				</a>
			</c:if>
		</div>
	</div>
	<script type="text/javascript">
		var page = '${pageMaker.criDto.page}';
		var search_option = '${search_option}';
		var keyword = '${keyword}';
		var sort_type = '${sort_type}';

		$(document).ready(function() {
			if('${sort_type}'=='new'){
				$('#board_sort a:nth-child(1)').css('background-color','#5D5D5D')
												.css('color', 'white');
			}else if('${sort_type}'=='good'){
				$('#board_sort a:nth-child(2)').css('background-color','#5D5D5D')
				.css('color', 'white');
			}else if('${sort_type}'=='reply'){
				$('#board_sort a:nth-child(3)').css('background-color','#5D5D5D')
				.css('color', 'white');
			}else if('${sort_type}'=='view'){
				$('#board_sort a:nth-child(4)').css('background-color','#5D5D5D')
				.css('color', 'white');
			}
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
			$('#search_btn').click(function(event) {
				search_option = $('#selsearch').val();
				keyword = $.trim($('#search_board').val());
				
				if(keyword == null || keyword.length == 0){
					$('#search_board').focus();
					$('search_board').css('border', '1px solid tomato');
					return false;
				}
				moveURL();
			});

			$('#board_sort a').click(function(event) {
				sort_type = $(this).attr('value');
				moveURL();
			});
			
			
		});
		function movePage(iPage){
			page = iPage;
			moveURL();
		}
		function moveURL(){
			location.href = "${path}/boardList.ms?page="+page+"&sort_type="+sort_type+"&keyword="+keyword+"&search_option="+search_option;
		}
	</script>
</body>
</html>