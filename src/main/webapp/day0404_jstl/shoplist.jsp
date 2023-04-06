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
	<h3 class = 'alert alert-info'>Shop List</h3><br>
	<h3>총 ${count}개의 상품이 있습니다</h3>
	<table class = 'table table-bordered' style = 'width: 600px;'>
		<tr style = "background-color: #ccc">
			<th width = '50px'>번호</th>
			<th width = '150px'>상품명</th>
			<th width = '60px'>색상</th>
			<th width = '70px'>수량</th>
			<th width = '100px'>단가</th>
			<th width = '100px'>입고일</th>
		</tr>
		<c:forEach var = "dto" items = '${list}' varStatus ='i'>
			<tr>
				<td align = 'center'>${i.count}</td>
				<td>
					<img src = "../image/${dto.photo}" width = '60px' bordoer = '1' hspace = '10'>
					<b>${dto.sangpum}</b>
				</td>
				<td>
					<div style = 'width: 40px; height: 40px; border: 1px solid black; background-color: ${dto.color}'></div>
				</td>
				<td>${dto.su}개</td>
				<td>
					<fmt:formatNumber value = "${dto.dan}" type = "currency" maxFractionDigits = '0' currencySymbol="$"/>
				</td>
				<td>${dto.ipgoday}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>