<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
<head>
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
			margin: 50px auto 10px;
			box-sizing: border-box;
			text-align: center;
			font-size: 50px;
		}
		.join_content {
			width: 800px;
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
			display: flex;
			justify-content: center;
		}
		.btn_double_area > span{
			display: block;
			width: 40%;
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
		.point_text{
			color: dodgerblue;
		}
		.join_row{
			padding: 10px;
			width: 80%;
			margin: auto;
		}
		.join_row > div{
			margin: 10px;
			font-weight: bold;
		}
	</style>
</head>
<body>

	<header>
		<div class="header">
			<a href="#" class="n_logo">MECAISLAND</a>
		</div>
		<div style="text-align: center; font-size: 2em; margin: 20px;">
			<h3>회원탈퇴</h3>
		</div>
	</header>

	<section>
		<form class="join_form" method="POST" action="">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row" style="border:2px solid black; width: 800px; height: 200px; border-radius: 10px;">
							<div style="text-align: center;"><span class="point_text">"${sessionScope.loginUser.name} 님"</span> 회원 탈퇴시 아래의 조치가 취해집니다.</div>
							<div>1. 계정정보는 <span class="point_text">"개인 정보 보호 정책"에 따라 60일간 보관(잠김)되며,</span> 60일이 경과된 후에는 모든 개인정보는 완전히 삭제되어 더 이상 복수할 수 없게 됩니다.</div>
							<div>2. 작성된 게시물은 삭제되지 않으며, 익명처리 후 <span class="point_text">Mecaisland로 소유권이 귀속</span>됩니다.</span></div>
							<div>3. 게시물 삭제가 필요한 경우에는 관리자에게 문의해 주시기 바랍니다.</div>
						</div>

						
					</div>
					
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id">
								<input type="text" id="id" name="id" class="int" maxlength="20" value="${sessionScope.loginUser.id}" readonly="readonly" style="background-color: darkgray">
							</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="name">비밀번호</label>
							</h3>
							<span class="ps_box">
								<input type="password" id="pw" name="pw" class="int" maxlength="20">
							</span>
							<span class="error_next_box">필수 정보입니다.	</span>
						</div>
					</div>

					<div class="btn_double_area">
						<span>
							<a href="#" class="btn_type">취소</a>
						</span>
						<span>
							<a href="#" class="btn_type">탈퇴</a>
						</span>
					</div>
				</div>
			</div>
		</form>
	</section>

	<footer style="margin: 50px;">
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
			var state = false;
			$("#pw").keyup(function(event) {
				var id = "${sessionScope.loginUser.id}";
				var pw = $(this).val();
				$.ajax({
					url: 'pwCheckAjax.ms',
					type: 'POST',
					dataType: 'json',
					data: "id="+id+"&pw="+pw,
					async : false,
					success: function(data){
						if(data.message == "-1"){
							$('.error_next_box').text('비밀번호가 일치하지 않습니다')
												.css('color', 'tomato')
												.css('display', 'block');
							state = true;
						}else{
							$('.error_next_box').text('올바른 비밀번호')
												.css('color', 'dodgerblue')
												.css('display', 'block');
							state = false;
						}
					}
				})
			});
		});
	</script>
</body>
</html>