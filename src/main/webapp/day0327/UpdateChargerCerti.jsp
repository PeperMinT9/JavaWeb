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
	String port_certi = request.getParameter("port_certi");
%>
<body>
	<button type="button" id="return_back" onclick = "history.back()" class = "btn btn-primary">뒤로가기</button>
	<br><br>
	<form action = "UCCertiAction.jsp" method = "post">
		<!-- hidden -->
		<input type = "hidden" name = "id" value = "<%=id%>">
		<table>
			<tr>
				<th>출력 지원</th>
				<td><input type = "text" value = <%=port_certi%> name = "port_certi"></td>
			</tr>
		</table>
		<button type = 'submit' class = 'btn btn-warning'>수정하기</button>
	</form>
</body>
</html>