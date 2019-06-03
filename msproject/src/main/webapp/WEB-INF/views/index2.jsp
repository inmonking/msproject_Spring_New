<%@page import="java.util.HashMap"%>
<%@page import="com.msproject.domain.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, ProductDTO> map = (HashMap)request.getAttribute("pLists");
	List<ProductDTO> list = (List<ProductDTO>)map.get("bList");
	List<ProductDTO> nlist = (List<ProductDTO>)map.get("nList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	@import url('resources/css/inmoncarocel.css');
	#head_div{
		width: 1300px; 
		display: flex; 
		margin: 0 auto;
	}
	#head_div_nav{
		width: 400px; 
		border: 1px solid #dadada; 
		padding: 20px;
		box-shadow: 2px 2px 2px rgba(0,0,0,0.1);
	}
	#head_div_nav > div{
		font-size: 0.9em;
		font-weight: bold;
		margin-bottom: 5px;
		color: #333333;
	}
	#aboutme{
		box-shadow: 2px 2px 2px rgba(0,0,0,0.1);
	}
</style>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<div id="head_div">
		<div id="head_div_nav">
			<div>블로그</div>
			<div>카페</div>
			<div>코딩교육</div>
			<div>대량요청</div>
			<div>서류요청</div>
			<div>후불결제</div>
			<div>리셀러</div>
			<div>자유게시판</div>
		</div>
		<div id="aboutme" class="inmon_carosel rightslide container-fluid">
			<div class='carosel_content'>
				<button class="carosel_leftbutton"><i class="fas fa-chevron-left"></i></button>
				<button class="carosel_rightbutton"><i class="fas fa-chevron-right"></i></button>
				<div class="carosel_view">
					<div class="carocel_slide">
						<div id="card01" class="carosel_slide_card">
							<img src="resources/img/lamp-01.png" style="width: 1100px; height: 500px">
						</div>
						<div id="card02" class="carosel_slide_card">	
							<img src="resources/img/emily.png" style="width: 1100px; height: 500px">	
						</div>
						<div id="card03" class="carosel_slide_card">
							<img src="resources/img/big-board-sale-banner.png" style="width: 1100px; height: 500px">
						</div>
					</div>
				</div>
			</div>
			<ul class="carosel_nav">
				<li class="carosel_nav_menu"></li>
				<li class="carosel_nav_menu"></li>
				<li class="carosel_nav_menu"></li>
			</ul>
		</div>
	</div>
	
	
	
	
	<div style="width: 1300px; margin: 0 auto; margin-top: 50px;">
	<div>
		<img src="resources/img/mechanews.png" style="margin: 20px;">
		<img src="resources/img/edu_pdf.png" style="margin: 20px; margin-left: 400px;">
	</div>
		<div style="display: flex">
			<img src="resources/img/news_01.png" style="border: 1px solid #dadada;">
			<span style="width:350px; height: 300px; border: 1px solid #dadada; margin-left: 50px;">
				<img src="resources/img/book_img_playLora.png" style="margin: 50px 85px;">
			</span>
		</div>
	</div>
	<div style="width: 1300px; margin: 0 auto; margin-top: 50px;">
		
			<img src="resources/img/popular.png" style="margin: 20px;">
		
		<div style="display: flex;">
			<div style="width: 300px;">
				<img src="resources/img/arduino_banner.png" style="width: 300px; height: 504px;">
			</div>
			<div style="width: 1000px;">
				<table>
					<tr>
						<%for(int i = 0; i<4; i++){%>
							<td style="">
								<div style="width:250px; height: 250px; text-align: center; box-shadow: 2px 2px 2px rgba(0,0,0,0.1);">
									<div style="width: 100%; height: 200px; display: flex; justify-content: center; align-items: center;">
									<img src="resources/img/<%=list.get(i).getP_img() %>" style="width: 150px">
									</div>
									<hr style="margin: 0px;">
									<p style="overflow: hidden; text-overflow: ellipsis;white-space: nowrap; width: 250px; height: 20px; margin-top: 10px; margin-bottom: 0px;"><%=list.get(i).getP_name() %></p>
									<div style="text-align: right; color: tomato; padding-right: 20px; font-size: 0.9em"><fmt:formatNumber value="<%=list.get(i).getP_price() %>" pattern="#,###"/>원</div>
								</div>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for(int i = 4; i<8; i++){%>
							<td style="">
								<div style="width:250px; height: 250px; text-align: center; box-shadow: 2px 2px 2px rgba(0,0,0,0.1);">
									<div style="width: 100%; height: 200px; display: flex; justify-content: center; align-items: center;">
									<img src="resources/img/<%=list.get(i).getP_img() %>" style="width: 150px">
									</div>
									<hr style="margin: 0px;">
									<p style="overflow: hidden; text-overflow: ellipsis;white-space: nowrap; width: 250px; height: 20px; margin-top: 10px; margin-bottom: 0px;"><%=list.get(i).getP_name() %></p>
									<div style="text-align: right; color: tomato; padding-right: 20px; font-size: 0.9em"><fmt:formatNumber value="<%=list.get(i).getP_price() %>" pattern="#,###"/>원</div>
								</div>
							</td>
						<%} %>
					</tr>
				</table>
			</div>
		</div>
	</div>
		<div style="width: 1300px; margin: 0 auto; margin-top: 50px;">
		<img src="resources/img/newproduct.png" style="margin: 20px;">
		<div style="display: flex;">
			<div style="width: 300px;">
				<img src="resources/img/raspberry_banner.png" style="width: 300px; height: 504px;">
			</div>
			<div style="width: 1000px;">
				<table>
					<tr>
						<%for(int i = 0; i<4; i++){%>
							<td style="">
								<div style="width:250px; height: 250px; text-align: center; box-shadow: 2px 2px 2px rgba(0,0,0,0.1);">
									<div style="width: 100%; height: 200px; display: flex; justify-content: center; align-items: center;">
									<img src="resources/img/<%=nlist.get(i).getP_img() %>" style="width: 150px">
									</div>
									<hr style="margin: 0px;">
									<p style="overflow: hidden; text-overflow: ellipsis;white-space: nowrap; width: 250px; height: 20px; margin-top: 10px; margin-bottom: 0px;"><%=nlist.get(i).getP_name() %></p>
									<div style="text-align: right; color: tomato; padding-right: 20px; font-size: 0.9em"><fmt:formatNumber value="<%=nlist.get(i).getP_price() %>" pattern="#,###"/>원</div>
								</div>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for(int i = 4; i<8; i++){%>
							<td style="">
								<div style="width:250px; height: 250px; text-align: center; box-shadow: 2px 2px 2px rgba(0,0,0,0.1);">
									<div style="width: 100%; height: 200px; display: flex; justify-content: center; align-items: center;">
									<img src="resources/img/<%=nlist.get(i).getP_img() %>" style="width: 150px">
									</div>
									<hr style="margin: 0px;">
									<p style="overflow: hidden; text-overflow: ellipsis;white-space: nowrap; width: 250px; height: 20px; margin-top: 10px; margin-bottom: 0px;"><%=nlist.get(i).getP_name() %></p>
									<div style="text-align: right; color: tomato; padding-right: 20px; font-size: 0.9em"><fmt:formatNumber value="<%=nlist.get(i).getP_price() %>" pattern="#,###"/>원</div>
								</div>
							</td>
						<%} %>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div style="width: 1300px; margin:50px auto 0px auto;">
		<img src="resources/img/brand.png" style="margin: 20px auto;">
	</div>
	<div style="position: relative;width: 1300px; height: 200px; margin: 0 auto;">
		<span style="position: absolute; left: 0px;z-index: 50; width: 20px; height: 20px;top: 95px;"><i style="font-size: 20px" class="fas fa-chevron-left"></i></span>
		<span style="position: absolute; right: 0px;z-index: 50; width: 20px; height: 20px;top: 95px;"><i style="font-size: 20px" class="fas fa-chevron-right"></i></span>
		<ul style="float: left; width: 1300px; margin: 0 auto;">
			<li style="float: left; margin-left: 18px;"><img src="resources/img/makers.png"></li>
			<li style="float: left; margin-left: 18px;"><img src="resources/img/mdx.png"></li>
			<li style="float: left; margin-left: 18px;"><img src="resources/img/newlearn.png"></li>
			<li style="float: left; margin-left: 18px;"><img src="resources/img/makeblock.png"></li>
		</ul>
	</div>
	<%@ include file="include/footer.jsp" %>
<script type="text/javascript" src="resources/js/inmoncarocel.js"></script>
</body>
</html>