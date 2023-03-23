<%@page import="study.dao.PersonDao"%>
<%@page import="study.dto.PersonDto"%>
<%@page import="java.sql.Timestamp"%>
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
	// 인코딩
	request.setCharacterEncoding("utf-8");
	
	// 데이터 각각 읽기
	String name = request.getParameter("name");
	int birthyear = Integer.parseInt(request.getParameter("birthyear"));
	String address = request.getParameter("address");
	String job = request.getParameter("job");
	String photo = request.getParameter("photo");
	
	// dto 선언
	PersonDto dto = new PersonDto();
	
	// 데이터 dto에 넣기
	dto.setName(name);
	dto.setAddress(address);
	dto.setBirthyear(birthyear);
	dto.setPhoto(photo);
	dto.setJob(job);
	
	// dao 선언
	PersonDao dao = new PersonDao();
	
	// insert 메서드 호출
	dao.insertPerson(dto);
	
	// 페이지 이동
	response.sendRedirect("personlist.jsp");

%>
</body>
</html>