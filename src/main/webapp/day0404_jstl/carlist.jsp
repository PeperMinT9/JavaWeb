<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h3 class = "alert alert-sueccess">Mycar List</h3>
	<h3>총 ${count}개의 차량이 있습니다</h3>
	<table class = 'table table-bordered'>
		<tr style = "background-color: #ccc;">
			<th>번호</th>
			<th>차량모델명</th>
			<th>가격</th>
			<th>사진</th>
			<th>구입일</th>
		</tr>
		<c:forEach var = "dto" items = "${list}" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${dto.carname}</td>
				<td><fmt:formatNumber value = "${dto.carprice}" pattern = "#,##0"/></td>
				<td>
					<img src = "../image/${dto.carphoto}" style = "width: 60px; height: 50px; border: 1px solid black;">
				</td>
				<td>
					<fmt:parseDate value = "${dto.guipday}" var = "guipday" pattern = "yyyy-MM-dd" scope = 'page'/>
					<fmt:formatDate value = '${guipday}' pattern = "yyyy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>