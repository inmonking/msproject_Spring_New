<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	footer > div{
	}
	#footer_table{
		border-collapse: collapse;
		margin: 20px;
	}
	#footer_table tr:first-child td{
		border-left: 1px solid #ddd;
		border-right: 1px solid #ddd;
	}
	#footer_table tr:first-child td:first-child{
		border-left: none;
	}
	#footer_table tr:first-child td:last-child{
		border-right: none;
	}
	#footer_table td{
		color: #999;
		font-size: 12px;
		padding: 0px 10px;
	}
	.center-time{
		font-size: 12px;
		margin-left: 10px;
		margin-bottom: 3px;
	}
</style>
<hr style="width:80%; margin: 10px auto; border: 0.5px solid #ddd">
	<footer style="height: 200px; display: flex;">
		<div style="width: 20%; min-width: 0%;"></div>
		<div style="min-width: 740px;">
			<table id="footer_table">
				<tr>
					<td>회사소개</td>
					<td>제휴제안</td>
					<td>이용약관</td>
					<td>개인정보처리방침</td>
					<td>청소년보호정책</td>
					<td>고객센터</td>
					<td>ⓒMecaisland Corp.</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">대표 : 인몬</td>
				</tr>
				<tr>
					<td colspan="3">이메일</td><td>대표번호</td>
				</tr>
				<tr>
					<td colspan="3">inmonking@gmail.com</td><td>010-8614-0000</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="5">Copyright ⓒ mecaisland.co.kr All right reserved</td>
				</tr>
			</table>
		</div>
		<div id="callcenter" style="min-width: 400px;">
			<div style="margin: 10px; margin-bottom: 2px;">고객센터</div>
			<div style="font-weight: bold; font-size: 2em"><i style="margin-left: 10px; margin-right: 10px" class="fas fa-phone-volume"></i>062-720-0000</div>
			<div class="center-time">평일 : 09:00 ~ 17:00</div>
			<div class="center-time">점심 : 12:00 ~ 13:00</div>
			<div class="center-time">주말 및 공휴일은 휴무입니다.</div>
		</div>
		</div>
		<div style="width: 20%; min-width: 0%;"></div>
	</footer>