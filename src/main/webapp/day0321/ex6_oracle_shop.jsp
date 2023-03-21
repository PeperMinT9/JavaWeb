<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="study.day0321.OracleShopDao"%>
<%@page import="study.day0321.OracleShopDto"%>
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
<style>
	div.box {
		width: 40px;
		height: 40px;
		border-radius: 100px;
		border: 1px solid black;
	}

</style>
</head>
<body>
	<%
	OracleShopDao osd = new OracleShopDao();
	List<OracleShopDto> list = osd.getAllSangpums();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시");
	%>
	<table>
		<%
		int n = 1;
		for(OracleShopDto dto: list) {%>
			<tr>
				<td><%=n++ %></td>
				<td><%=dto.getSangpum() %></td>
				<td>
					<div style="background-color: <%=dto.getColor()%>"
					class="box"></div>
					<b style="font-size: 10px"><%=dto.getColor() %></b>
				</td>
				<td><%=dto.getSu() %></td>
				<td><%=sdf.format(dto.getToday()) %></td>
			</tr>
			
			
		<%} %>
		
		
	
	</table>
</body>
</html>