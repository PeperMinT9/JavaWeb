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
	<h3 class = 'alert alert-success'>Person List</h3><br>
	<h3>총 ${count}명의 사람이 있습니다</h3>
	<table class = 'table table-bordered'>
		<tr style = "background-color: #ccc;">
			<th>번호</th>
			<th>이름</th>
			<th>생년</th>
			<th>주소</th>
			<th>직업</th>
			<th>사진</th>
		</tr>
		<c:forEach var = "dto" items = '${list}' varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${dto.name}</td>
				<td>
					${dto.birthyear}<br>
					<c:choose>
						<c:when test = "${dto.birthyear % 12 == 0}">
							-원숭이띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 1}">
							-닭띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 2}">
							-개띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 3}">
							-돼지띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 4}">
							-쥐띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 5}">
							-소띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 6}">
							-호랑이띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 7}">
							-토끼띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 8}">
							-용띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 9}">
							-뱀띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 10}">
							-말띠
						</c:when>
						<c:when test = "${dto.birthyear % 12 == 11}">
							-양띠
						</c:when>
					</c:choose>
				</td>
				<td>${dto.address}</td>
				<td>${dto.job}</td>
				<td>
					<img src = "../image/${dto.photo}" style = "width: 60px; height: 50px;">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>