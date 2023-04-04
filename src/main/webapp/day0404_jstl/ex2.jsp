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
	<fmt:requestEncoding value = "utf-8"/>
	<form action = 'ex2.jsp' method = 'post'>
		이름: <input type = 'text' name = 'irum'><br>
		나이: <input type = 'text' name = 'nai'><br>
		가고싶은 나라: <input type="text" name="nara"><br>
		<button type = 'submit'>서버에 전송</button>
	</form>
	
	<c:if test="${!empty param.irum}">
		이름: ${param.irum}<br>
		나이: ${param.nai}<br>
		
		<c:if test="${param.nai >= 20}">
			<h2 style="color: blur">${param.irum}님은 성인입니다</h2>
		</c:if>
		<c:if test="${param.nai < 20}">
			<h2 style="color: blur">${param.irum}님은 미성년자입니다</h2>
		</c:if>
		
		<c:set var = 'nara' value = '${param.nara}'></c:set>
		
		<c:choose>
			<c:when test="${nara == '하와이' }">
				<h3 style = 'color: green;'>하와이의 바다는 아름답습니다</h3>
			</c:when>
			<c:when test="${nara == '파티야' }">
				<h3 style = 'color: green;'>파티야의 바다는 아름답습니다</h3>
			</c:when>
			<c:when test="${nara == '다낭' }">
				<h3 style = 'color: green;'>다낭의 바다는 아름답습니다</h3>
			</c:when>
			
			<c:otherwise>
				<h3 style = 'color: gray;'>${nara}에 가보지는 않았지만</h3>
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>