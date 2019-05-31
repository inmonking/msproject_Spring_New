<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	@import url('css/constract.css');
</style>
</head>
<body>
	<header>
		<div class="header">
			<a href="#" class="n_logo">MECAISLAND</a>
		</div>
	</header>
	<section>
		<div class="container">
			<form class="join_content" action="join.ms" method="post">
				<div class="terms">
					<p class="terms_p">
						<span class="terms_span">
							<input type="checkbox" id="cbox">
							<label for="cbox">
								이용약관, 개인정보 수집 및 이용,<br>
								위치정보 이용약관(선택), 프로모션 안내<br>
								매일 수신(선택)에 모두 동의합니다.
							</label>
						</span>
					</p>
					<ul class="terms_ul">
						<li class="terms_ul_li1">
							<span class="ul_li_span">
								<input type="checkbox" id="li1box" class="ckboxs">
								<label for="li1box" class="label1">
									네이버 이용약관 동의<span class="span_only">(필수)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<h3 class="article_title">제 1 조 (목적)</h3>
									<p>이 약관은 네이버 주식회사 ("회사" 또는 "네이버")가 제공하는 네이버<br> 및 네이버 관련 제반 서비스의 이용과 관련하여 회사의 회원과의 권리, <br> 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p><br>
									<h3 class="article_title">제 2 조 (정의)</h3>
									<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유<br> 무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 네이버 및 네이<br>버 관련 제반 서비스를 의미합니다.</p><br>
									
								</div>
							</div>
						</li>

						<li class="terms_ul_li2">
							<span class="ul_li_span">
								<input type="checkbox" id="li2box" class="ckboxs">
								<label for="li2box" class="label1">
									개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하<br>는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및<br> 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>

									<h3 class="article_title">1. 수집하는 개인정보</h3>
									<p>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네<br>이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘<br>린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위<br>해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 <br>개인정보를 수집합니다.</p>
								</div>
							</div>
						</li>
						
						<li class="terms_ul_li3">
							<span class="ul_li_span">
								<input type="checkbox" id="li3box" class="ckboxs">
								<label for="li3box" class="label1">
									위치정보 이용약관 동의<span class="span_select">(선택)</span>
								</label>
							</span>
							<div class="terms_box">
								<div class="article">
									<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을<br> 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다</p><br>
									<h3 class="article_title">제 1 조 (목적)	</h3>
									<p>이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는<br> 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의<br>무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
								</div>
							</div>
						</li>

						<li class="terms_ul_li4">
							<span class="ul_li_span">
								<input type="checkbox" id="li4box" class="ckboxs">
								<label for="li4box" class="label1">
									이벤트 등 프로모션 알림 메일 수신
									<span class="span_select">(선택)</span>
								</label>
							</span>
						</li>

					</ul>
					
				</div>
				<div class="btn_double_area">
					<span><a href="#" class="btn_type btn_default">비동의</a></span>
					<span><a class="btn_type btn_agree">동의</a></span>
				</div>
			</form>
			<div class="group_join">
				회사, 동아리 등 단체에서 사용할 ID가 필요하세요?
				<a href="#">단체 회원 가입</a>		
			</div>
		</div>
	</section>
	<footer>
	</footer>
	<script type="text/javascript">
		$(document).ready(function() {
			var ckcount = $('.ckboxs').length;
			$('#cbox').click(function(event) {
				var flag = $(this).is(':checked');
				if(flag){
					$('.ckboxs').prop({checked: true});
				}else{
					$('.ckboxs').prop({checked: false});
				}
			});
			$('.ckboxs').click(function(event) {
				var ckleng = $('.ckboxs:checkbox:checked').length;
				if(ckleng == ckcount){
					$('#cbox').prop('checked',true);
				}else{
					$('#cbox').prop('checked',false);					
				}
			});
			$('.btn_agree').click(function(event) {
				var must1 = $('#li1box').is(':checked');
				var must2 = $('#li2box').is(':checked');
				if(must1&&must2){
					location.href="join.ms";
				}else{
					alert("필수란은 반드시 동의 해야함");
				}
			});
			/*$('.btn_agree').click(function(event) {
				alert($('#cbox').is(':checked'));
			});*/
		});
	</script>
</body>
</html>