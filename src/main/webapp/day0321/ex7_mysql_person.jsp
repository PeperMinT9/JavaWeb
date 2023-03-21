<%@page import="java.util.Date"%>
<%@page import="study.day0321.PersonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.day0321.PersonDao"%>
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
	PersonDao pd = new PersonDao();
	List<PersonDto> list = pd.getAllPerson();
	Date date = new Date();
	int currYear = date.getYear() + 1900;
	%>
	<table class = "table table-bordered">
		<%
		int list_length = list.size();
		for(int i = 0; i < list_length; i++) {
			PersonDto dto = list.get(i);
			// 나이
			int age = currYear - dto.getBirthyear();
			// 띠
			int m = dto.getBirthyear() % 12;
			String ddi = m == 0? "원숭이" : m == 1? "닭" : m == 2? "개" : 
				m == 3? "돼지" : m == 4? "쥐" : m == 5? "소" : m == 6? "호랑이" : 
				m == 7? "토끼" : m == 8? "용" : m == 9? "뱀" : m == 10? "말" : "양";
						
			 %>
			<tr>
				<td><img src = "../image/<%=dto.getPhoto() %>" style = "width: 200px"></td>
				<td>
					이름: <%=dto.getName() %><br>
					년생: <%=dto.getBirthyear() %>(<%=age %>세, <%=ddi %>띠)<br>
					<%=dto.getAddress() %><br>
					<%=dto.getJob() %><br>
				</td>
			</tr>
		<%} %>
	</table>
</body>
</html>