<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
	<h2>구구단</h2>
	<table style="width: 100%;" class="tab1">
		<tr bgcolor = "orange">
			<%
				for(int dan = 2; dan < 10; dan++) { %>
					<th><%=dan%>단</th>
				<%}
			%>
		</tr>
		<%
			for(int i = 1; i < 10; i++) { %>
				<tr>
				<% for(int dan = 2; dan < 10; dan++) { %>
					<td><%=dan%> x <%=i%> = <%=dan * i%></td>
				<%} %>
				</tr>
			<%}
		%>
	</table>
</body>
</html>