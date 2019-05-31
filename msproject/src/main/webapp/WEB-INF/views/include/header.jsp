<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${path}/css/common.css?v=1">
	<link rel="stylesheet" href="${path}/css/header.css?v=1">
<body>
<div class="headerbody">
	<div id="modal_login" style="width: 100%; height: 100%; position: fixed; background-color: rgba(50,50,50,0.8); z-index: 1000; display: none; justify-content: center; align-items: center;">
		<div style="width: 400px; height: 400px; background-color: white; border-radius: 10px; overflow: hidden; border: none;">
			<div style="text-align: right;width: 385px"><span id="close" style="position: absolute; border-radius: 100px; width: 15px; text-align: center;font-weight: bold;font-size: 10px; color:white; cursor: pointer">X</span></div>
			<a href="${path }/index.ms"><div style="height: 100px; font-size: 3em; display: flex; justify-content: center; align-items: center;background-color:rgb(50,50,50); color: white; user-select: none;">MECAISLAND</div></a>
			<div style="height: 220px">
				<div style="position: relative;padding: 10px">
					<div style="margin: 20px; border: 1px solid darkgray; padding: 5px; text-align: center"><span><input type="text" name="id" id="id" style="width: 100%;height: 34px; border:none" placeholder="아이디"></span></div>
					<div style="margin: 20px; margin-bottom:10px; border: 1px solid darkgray; padding: 5px; text-align: center"><span><input type="password" name="pass" id="pass" style="width: 100%;height: 34px; border:none" placeholder="비밀번호"></span></div>
					<div id="err_check_msg" style="color: tomato; font-size: 12px; margin-left: 20px;opacity: 0; transition: 0.2s">경고 메시지 칸</div>
					<div style="margin: 20px; margin-top:10px;background-color: rgba(100,100,100);"><div id="login_btn" style="text-align: center; color: white;  padding: 10px; cursor: pointer;user-select: none;">로그인</div></div>
				</div>
			</div>
			<hr style="margin:0 auto; width: 90%;">
			<div style="height: 80px">
				<div style="display: flex; font-size: 12px; justify-content: center; align-items: center;">
					<span style="padding: 5px;">아이디 찾기 </span>
					<span style="padding: 5px;">비밀번호 찾기 </span>
					<span style="padding: 5px;">회원 가입</span>
				</div>
			</div>
		</div>
	</div>
	<header>
		<div style="background-color:rgb(100,100,100);">		
			<div style="position: relative; width: 1500px;  margin: 0 auto; background-color:rgb(100,100,100);">
				<span style="width: 20%; height: inherit;">
					<span class="header_sns" style="text-decoration: none;font-size: 1.5em;">
						<a href="#"><i class="fab fa-instagram"></i></a>
						<a href="#"><i class="fab fa-facebook-square"></i></a>
						<a href="#"><i class="fab fa-twitter-square"></i></a>
						<a href="#"><i class="fab fa-google"></i></a>
						<a href="#"><i class="fab fa-line"></i></a>
					</span>
				</span>
				<span style="position: absolute; right: 0px;width: 20%;">
					<ul class="header_ul">
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
						<li id="login" style="cursor: pointer;">로그인</li>
						<li><a href="${path}/constract.ms">회원가입</a></li>
						</c:when>
						<c:otherwise>
						<li id="loginInfo">
							<span>${sessionScope.loginUser.name }</span>
							(${sessionScope.loginUser.id })
						</li>
						<li><a href="#" class="logout_btn">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
						<li>고객센터</li>
					</ul>
				</span>
			</div>
		</div>
		<div style="position: relative;  width: 100%; height: 100px; background-color:rgb(50,50,50);">
			<div style="position:relative; width: 1500px; height: inherit; margin: 0 auto;background-color:rgb(50,50,50);">
				<a href="${path }/index.ms"><span style="color: white; font-size: 3em; line-height: 90px; user-select: none;">MECAISLAND</span></a>
				<div style="position:absolute; width: 30%;height: 40px; left: 35%;top: 30px;background-color: white;">
					<input type="text" style="width: 85%;margin-left: 2%; margin-top: 8px; border: none">
					<a href="" style="position:absolute; right: 15px;font-size: 1.5em;line-height: 40px; color: black"><i class="fas fa-search"></i></a>
				</div>
				<div style="position: absolute; width: 20%; height: inherit; right: 0px; top:10px; display: flex;">

					<div style="width: 240px; font-size: 3em; display: flex;justify-content: center;"><a href="infoUpdate.ms" style="text-align: center;"><i class="fas fa-user"></i><p style="font-size: 12px">마이페이지</p></a></div>

					<div style="width: 240px; font-size: 3em; display: flex;justify-content: center;"><a href="" style="text-align: center;"><i class="fas fa-shopping-basket"></i><p style="font-size: 12px">장바구니</p></a></div>
					<div style="width: 240px; font-size: 3em; display: flex;justify-content: center;"><a href="" style="text-align: center;"><i class="fas fa-truck"></i><p style="font-size: 12px">배송조회</p></a></div>
				</div>
			</div>
		</div>
	</header>
	<content style="width: 1500px; margin: 0 auto;">
		<div style="background-color:rgb(50,50,50);">
			<div style="width: 1500px; margin:0 auto; background-color:rgb(50,50,50); height: 35px">
				<ul class="header_ul" id="main_menu" style="float: left; font-size: 15px;">
					<li>반도체/전자부품</li>
					<li>MCU컨트롤러</li>
					<li>DIY키트</li>
					<li>센서/감지</li>
					<li>모듈/전기부품</li>
					<li>모터/기계</li>
					<li>조명/LCD</li>
					<li>전원/배터리</li>
					<li>전선/케이블</li>
					<li>버튼/스위치</li>
					<li>커넥터</li>
					<li>자유게시판</li>
				</ul>
			</div>	
		</div>
	</content>	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#login').click(function(event) {
				$('#modal_login').css('display','flex');
			});
			$('#close').click(function(event) {
				$('#modal_login').css('display','none');
				$('#id').val('');
				$('#pass').val('');
				$('#err_check_msg').css('opacity', '0');
			});

			$('#login_btn').click(function(event) {
				var id = $.trim($('#id').val());
				var pass = $.trim($('#pass').val());
				var regEmpty = /\s/g;
				var stopflag = true;

				if(id==null || id.length == 0){
					$('#err_check_msg').text('필수정보 입니다')
					.css('opacity', '1');
					stopflag = false;
				}else if(id.match(regEmpty)){
					$('#err_check_msg').text('공백없이 입력해주세요.')
					.css('opacity', '1');
					stopflag = false;
				}
				if(!stopflag){
					$('#id').focus();
					return false;
				}

				if(pass==null || pass.length == 0){
					$('#err_check_msg').text('필수정보 입니다')
					.css('opacity', '1');
					stopflag = false;
				}else if(pass.match(regEmpty)){
					$('#err_check_msg').text('공백없이 입력해주세요.')
					.css('opacity', '1');
					stopflag = false;
				}
				if(!stopflag){
					$('#pass').focus();
					return false;
				}
				
				$.ajax({
					url: '${path}/login.ms',
					type: 'POST',
					dataType: 'JSON',
					data: "id="+id+"&pw="+pass,
					success: function(data){
						if(data.message == "1"){
							location.reload();
						}else if(data.message == "-1"){
							$('#inputid').focus();
							$('#err_check_msg').text('회원 아이디 또는 비밀번호가 일치하지 않습니다.')
											   .css('opacity','1');
						}
					},
					error:function(){
						alert("system error");
					}
				})
			});
			$('.logout_btn').click(function(event) {
				$.ajax({
					url: 'logoutAjax.ms',
					type: 'POST',
					dataType: 'json',
					success: function(data){
						location.reload();
					},
					error:function(){
						alert("system error");
					}
				})
				
			});
			$('#main_menu > li:nth-child(12)').click(function(){
				location.href = "${path}/boardList.ms";
			});
		});
	</script>
</div>
</body>
</html>