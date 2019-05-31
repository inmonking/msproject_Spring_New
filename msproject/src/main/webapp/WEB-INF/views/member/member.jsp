<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입 페이지</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<style type="text/css">
		@import url('css/member.css?v=1');
		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding');
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="js/member.js?v=1"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="js/daum_address.js"></script>
</head>
<body>
	<header></header>
	<form id="joinform" action="joinPlay.ms" method="post">
		<section>
			<div id="section_head">
				<p><i class="fas fa-user-friends"></i> 계정을 생성하세요.</p>
				<div id="step">
					<div class="step_circle"><div class="step_dot" id="dot1"></div></div>
					<div class="step_line"><div></div></div>
					<div class="step_circle"><div class="step_dot" id="dot2"></div></div>
					<div class="step_line"><div></div></div>
					<div class="step_circle"><div class="step_dot" id="dot3"></div></div>
				</div>
			</div>
			<div id="slide">
				<div id="join_page01" class="join_page">
					<div id="join_name">이름
						<div id="input_tag">
							<div>
								<input id="uname" name="uname" type="text" maxlength="11">
							</div>
							<div id="box1" class="box">
							</div>
						</div>
					</div>
					
					<div id="join_phone"><p id="toggleText">휴대전화</p>
						<div id="input_tag">
							<div>
								<input id="uphone" name="uphone" type="text" maxlength="11">
							</div>
							<div id="box2" class="box">
							</div>
						</div> 
					</div>
					<div class="messageBox" id="phoneMsg">
						<div>
							<div>메일주소가 중복됩니다.</div>
						</div>
					</div>
					<div id="join_Mail"><p id="toggleMail">이메일로 가입하기</p></div>
					<div class="nextbtn" id="nextbtn_01"><i class="fas fa-arrow-right"></i></div>
				</div>
				<div id="join_page02" class="join_page" style="display: none;">
					<div id="join_id">아이디
						<div id="input_tag">
							<div>
								<input id="uid" name="uid" type="text" maxlength="20">
							</div>
							<div id="box1" class="box">
							</div>
						</div>
					</div>
					<div class="messageBox" id="idMsg">
						<div>
							<div>영문,숫자 조합 4~12자로 부탁해요!</div>
						</div>
					</div>
					<div id="join_pw">비밀번호
						<div id="input_tag">
							<div>
								<input id="upw" name="upw" type="password" maxlength="12">
							</div>
							<div id="box1" class="box">
							</div>
						</div>
					</div>
					<div class="messageBox" id="pwMsg">
						<div>
							<div>영문,숫자 조합 4~12자로 부탁해요!</div>
						</div>
					</div>
					<div id='pwretag'>비밀번호 확인
						<div id="input_tag">
							<div>
								<input id="upwre" type="password" maxlength="12">
							</div>
							<div id="box1" class="box">
							</div>
						</div>
					</div>
					<div class="messageBox" id="pwreMsg">
						<div style="width: 170px;">
							<div>같은 비밀번호를 입력해주세요!</div>
						</div>
					</div>
					<div class="nextbtn" id="nextbtn_02"><i class="fas fa-arrow-right"></i></div>
				</div>
	
	
				<div id="join_page03" class="join_page" style="display: none;">
					<div id="birth">생일
						<div>
							<span id="birth_yy">
								<input type="text" name="birth_yy" placeholder="년" maxlength="4">
							</span>
							<span id="birth_mm">
								<select name="birth_mm">
									<option>월</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</span>
							<span id="birth_dd">
								<input type="text" name="birth_dd" placeholder="일" maxlength="2">
							</span>
						</div>
					</div>
					<div id="address">주소
						<div>
							<input class="address_num" id="address_postcode" name="address_postcode" type="text" maxlength="5" placeholder="우편번호">
							<div class="address_search" onclick="DaumPostcode()">우편번호 검색</div>
							<input class="address_detail" id="address_basic" name="address_basic" type="text" placeholder="기본주소">
							<input class="address_detail" id="address_detail" name="address_detail" type="text" placeholder="상세주소">
						</div>
					</div>
					<button class="submit_btn">가입하기</button>
				</div>
			</div>
			<div id="info_modal">
				<div>
					<div><i class="fas fa-info-circle"></i>알림</div>
					<div>생일과 주소는 각종 이벤트<br><br>
					혹은 배송을 목적으로 수집됩니다.<br><br>이에 동의하지 않으시면<br><br>기입하지 않으셔도 무방합니다.</div>
					<div><div id="info_close">닫기</div></div>
				</div>
			</div>
		</section>
	</form>
</body>
</html>