<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	@import url('${path}/resources/css/constract.css');
</style>
</head>
<body>
	<header>
		<div class="header">
			<a href="#" class="n_logo"><img src="${path }/resources/img/mainlogo.png" style="width: 18% "></a>
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
									<p>이용약관 입력구간</p>
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
									<p>개인정보 수집 및 이용에 대한 안내 입력 구간</p>
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
									<p>위치정보 이용약관 안내 구간</p>
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
	<script type="text/javascript">
		$(document).ready(function() {
			var ckcount = $('.ckboxs').length;
			$('#cbox').click(function(event) {
				var flag = $(this).is(':checked');
				if(flag){
					$('.ckboxs').prop('checked',true);
				}else{
					$('.ckboxs').prop('checked',false);
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
					location.href="${path}/member/create";
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