<%-- <%@page import="com.msproject.dto.ProductDTO"%> --%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("bestList");
	List<ProductDTO> nlist = (List<ProductDTO>)request.getAttribute("newList");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	@import url('css/inmoncarocel.css');
</style>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<div style="position: fixed;width: 100px; height: 300px; border:1px solid black;">
		<span>빼액</span>
	</div>
	<div style="width: 1300px; display: flex; margin: 0 auto">
		<div style="width: 400px; border: 1px solid black; padding: 50px;"></div>
		<div id="aboutme" class="inmon_carosel rightslide container-fluid">
			<div class='carosel_content'>
				<button class="carosel_leftbutton"><i class="fas fa-chevron-left"></i></button>
				<button class="carosel_rightbutton"><i class="fas fa-chevron-right"></i></button>
				<div class="carosel_view">
					<div class="carocel_slide">
						<div id="card01" class="carosel_slide_card">
							<img src="image/lamp-01.png" style="width: 1100px; height: 500px">
						</div>
						<div id="card02" class="carosel_slide_card">	
							<img src="image/emily.png" style="width: 1100px; height: 500px">	
						</div>
						<div id="card03" class="carosel_slide_card">
							<img src="image/big-board-sale-banner.png" style="width: 1100px; height: 500px">
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
	<div style="width: 1300px; margin: 0 auto">
		<img src="image/popular.png" style="margin: 20px;">
		<div style="display: flex;">
			<div style="border: 1px solid black; width: 300px;"></div>
			<div style="border: 1px solid black; width: 1000px;">
				<table>
					<tr>
						<%-- <%for(int i = 0; i<4; i++){%>
							<td style="width:250px; height: 80%; text-align: center;">
							<img src="image/<%=list.get(i).getP_img() %>" style="width: 150px">
							<div><%=list.get(i).getP_name() %></div>
							<div><%=list.get(i).getP_price() %>원</div>
							</td>
						<%} %> --%>
					</tr>
					<tr>
					<%-- 	<%for(int i = 4; i<8; i++){%>
							<td style="width:250px; height: 80%; text-align: center;">
							<img src="image/<%=list.get(i).getP_img() %>" style="width: 150px">
							<div><%=list.get(i).getP_name() %></div>
							<div><%=list.get(i).getP_price() %>원</div>
							</td>
						<%} %> --%>
					</tr>
				</table>
			</div>
		</div>
	</div>
		<div style="width: 1300px; margin: 0 auto">
		<img src="image/newproduct.png" style="margin: 20px;">
		<div style="display: flex;">
			<div style="border: 1px solid black; width: 300px;"></div>
			<div style="border: 1px solid black; width: 1000px;">
				<table>
					<tr>
						<%-- <%for(int i = 0; i<4; i++){%>
							<td style="width:250px; height: 80%; text-align: center;">
							<img src="image/<%=nlist.get(i).getP_img() %>" style="width: 150px">
							<div><%=nlist.get(i).getP_name() %></div>
							<div><%=nlist.get(i).getP_price() %>원</div>
							</td>
						<%} %>
					</tr>
					<tr>
						<%for(int i = 4; i<8; i++){%>
							<td style="width:250px; height: 80%; text-align: center;">
							<img src="image/<%=nlist.get(i).getP_img() %>" style="width: 150px">
							<div><%=nlist.get(i).getP_name() %></div>
							<div><%=nlist.get(i).getP_price() %>원</div>
							</td>
						<%} %> --%>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div style="position: relative;width: 1300px; height: 200px; border: 1px solid black; margin: 0 auto;">
		<span style="position: absolute; left: 25px;line-height: 200px;"><i style="font-size: 20px" class="fas fa-chevron-left"></i></span>
		<span style="position: absolute; right: 25px;line-height: 200px;"><i style="font-size: 20px" class="fas fa-chevron-right"></i></span>
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<%@ include file="include/footer.jsp" %>
<script type="text/javascript" src="js/inmoncarocel.js"></script>
</body>
</html>