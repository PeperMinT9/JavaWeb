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
	int id = Integer.parseInt(request.getParameter("id"));
	int port_cnt = Integer.parseInt(request.getParameter("port_cnt"));
	int port_c = Integer.parseInt(request.getParameter("port_c"));
	int port_a = Integer.parseInt(request.getParameter("port_a"));
	String port_info = request.getParameter("port_info");
%>
<body>
	<button type="button" id="return_back" onclick = "history.back()" class = "btn btn-primary">뒤로가기</button>
	<br><br>
	<form action = "UCPortAction.jsp" method = "post">
		<!-- hidden -->
		<input type = "hidden" name = "id" value = "<%=id%>">
		<table>
			<tr>
				<th>포트수</th>
				<td><input type = "number" value = <%=port_cnt%> name = "port_cnt"></td>
			</tr>
			<tr>
				<th>c 타입 포트</th>
				<td><input type = "number" value = <%=port_c%> name = "port_c"></td>
			</tr>
			<tr>
				<th>a 타입 포트</th>
				<td><input type = "number" value = <%=port_a%> name = "port_a"></td>
			</tr>
			<tr>
				<th>출력 지원</th>
				<td><input type = "text" value = <%=port_info%> name = "port_info"></td>
			</tr>
		</table>
		<button type = 'submit' class = 'btn btn-warning'>수정하기</button>
	</form>
</body>
</html>