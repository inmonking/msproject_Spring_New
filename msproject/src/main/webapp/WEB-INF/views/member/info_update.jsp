<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
		*{
			box-sizing: border-box; font-family: font-family: 'Nanum Gothic', sans-serif;
		}
		body, h1, ul, p, h3 { margin:0; padding: 0;}
		body{background: #f5f6f7;}
		ul{list-style: none;}
		a{text-decoration: none; color: inherit;}

		.naver_logo{font-size: 2em;}
		.header, .container, .footer{
			width: 768px;
			margin: auto;
		}
		.header {
			position: relative;
		}
		.container {
			margin: 0 auto;
			max-width: 768px;
			min-width: 460px;
		}
		.footer {
			height: 81px;
			text-align: center;
			padding: 30px 0px 15px;
		}
		.n_logo {
			display: block;
			margin: 50px auto;
			box-sizing: border-box;
			text-align: center;
			font-size: 50px;
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.row_group{
			overflow: hidden;
			width: 100%;
		}
		.join_title {
			margin: 10px 0 8px;
			padding-left: 5px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box {
			display: block;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px;
			background: #fff;
			vertical-align: top;
		}
		.int_id{
			padding-right: 110px;
		}
		.int{
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.step_url{
			position: absolute;
			top: 16px;
			right: 13px;
			font-size: 15px;
			line-height: 18px;
			color: #8e8e8e;
		}
		.error_next_box{
			display: none;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
		}
		.int_pass{
			padding-right: 40px;
		}
		.bir_wrap{
			display: table;
			width: 100%;
		}
		.bir_dd, .bir_mm, .bir_yy{
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.bir_mm+.bir_dd, .bir_yy+.bir_mm{
			padding-left: 10px;
		}
		.join_birthday .ps_box{
			padding: 11px 14px;
		}
		.sel{
			background: #fff url('img/sel_arr.gif') 100% 50% no-repeat;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}

		.btn_double_area{
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span{
			display: block;
			width: 100%;
		}
		.btn_type{
			width: auto;
			margin: 0 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			height: 61px;
			padding-top: 1px;
			text-align: center;
			color: #fff;
			border: 1px solid rgba(100,100,100);
			background-color: rgba(100,100,100);
		}

		#footer *{
			font-size: 12px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul {
			margin: 0 auto 9px;
			text-align: center;
		}
		#footer > ul > li{
			display: inline;
			padding :0 5px 0 7px ;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li:first-child{
			border-left: 0px;
		}
		#footer > ul > li a:hover{
			color: #1fbc02;
			text-decoration: underline;
		}
		#addr_logo{
			width: 63px;
			height: 11px;
		}
		#address{
			margin: 0px auto;
			text-align: center;
		}
		#address * {
			font: 9px verdana;
		}
		#address a{
			font-weight: bold;
		}
		#address a:hover{
			color: #1bcc02;
		}
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp" %>

	<section>
		<form class="update_form" method="POST" action="infoUpdatePlay.ms">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="id" name="id" class="int" maxlength="20" value="${sessionScope.loginUser.id }">
							</span>
							<span class="error_next_box">필수 정보입니다.	</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="pswd1" name="pswd1" class="int" maxlength="20">
								<span class="step_url"><i class="fas fa-unlock-alt"></i></span>
							</span>
							<span class="error_next_box">
								필수 정보입니다.
							</span>

							<h3 class="join_title">
							<label for="pswd2">비밀번호 재확인</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="pswd2" name="pswd2" class="int" maxlength="20">
								<span class="step_url"><i class="fas fa-unlock-alt"></i></span>
							</span>
							<span class="error_next_box">
								필수 정보입니다.
							</span>
							</div>
					</div>
					
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="name" name="name" class="int" maxlength="20" value="${sessionScope.loginUser.name }">
							</span>
							<span class="error_next_box">필수 정보입니다.	</span>
						</div>

						<div class="join_row join_birthday">
							<h3 class="join_title">
								<label for="yy">생년월일</label>
							</h3>
						</div>
						<div class="bir_wrap">
							<div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" name="birth_year" placeholder="년(4자)" class="int" maxlength="4" value="${sessionScope.loginUser.birth_year }">
								</span>
							</div>
							<div class="bir_mm">
								<span class="ps_box">
									<select id="mm" name="birth_month" class="sel">
										<option>월</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</span>
							</div>
							<div class="bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" name="birth_day" placeholder="일" class="int" maxlength="2" value="${sessionScope.loginUser.birth_day }">
								</span>
							</div>
						</div>
						<div class="join_row">
							<h3 class="join_title">
								<label for="phone">핸드폰 주소</label>
							</h3>
							<span class="ps_box">
								<input type="text" id="phone" name="phone" class="int" maxlength="30" value="${sessionScope.loginUser.phone }" >
							</span>
							<span class="error_next_box">필수 정보입니다.	</span>
						</div>
					</div>

					<div class="btn_double_area">
						<span>
							<a class="btn_type btn_agree">정보수정</a>
						</span>
					</div>


				</div>
			</div>
		</form>
	</section>

	<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address">
					<span>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<span><strong><a href="#">Mecaisland Corp.</a></strong></span>
					<span>All Right Reserved.</span>
				</div>
			</div>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var month = "${sessionScope.loginUser.birth_month}";
			$('#mm').children('option').eq(month).attr('selected', 'selected');

			$('.btn_agree').click(function(event) {
				$('.update_form').submit();
			});
		});
	</script>
</body>
</html>