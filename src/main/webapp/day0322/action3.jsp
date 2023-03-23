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
<%
	request.setCharacterEncoding("utf-8");
	String sawon_name = request.getParameter("sawon");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobby");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
%>
<body>
	<h4>
		사원명: <%=sawon_name %><br>
		성별: <%=gender %><br>
		선택취미:<br>
		<%
		if(hobbies == null) {%>
			<b>인생 노잼!</b>
		<%}
		else {
			for(String s: hobbies) { %>
			<div class = "box" style = "background-color: <%=s %>"></div>
			<%}
		}%>
		<br style = "clear: both;">
		이메일: <%=email1 %>@<%=email2 %>
	</h4>
</body>
</html>