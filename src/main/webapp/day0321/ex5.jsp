<%@page import="study.day0321.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="study.day0321.ShopList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>
<body>
	<% 
	ShopList sl = new ShopList();
	List<ShopDto> list =sl.getAllSangpum();
	%>
	
	<table class = "table table-bordered">
	<tr style = "text-align: center">
		<th>이름</th><th>가격</th><th>색상</th><th>사진</th>
	</tr>
	<% 
	int shop_length = list.size();
	for(int i = 0; i < shop_length; i++) { 
		ShopDto dto = list.get(i); %>
		<tr style = "text-align: center">
			<td><%=dto.getSangpumName() %></td>
			<td><%=dto.getSangpumPrice() %></td>
			<td>
				<div style="width: 40px; height: 40px; background-color: <%=dto.getSangpumColor() %>;
				border: 1px dashed gray;"></div>
				<%=dto.getSangpumColor() %>
			</td>
			<td><img src = "../image/<%=dto.getSangpumPhoto()%>" style = "width: 200px"></td>
		</tr>
	<%} %>
	
	</table>
</body>
</html>