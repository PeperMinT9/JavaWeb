<%@page import="study.dao.day0322_carDao"%>
<%@page import="study.dto.day0322_carDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	String carname = request.getParameter("carname");
	int carprice = Integer.parseInt(request.getParameter("carprice"));
	String photo = request.getParameter("photo");
	String pur_date = request.getParameter("pur_date");
	
	day0322_carDto dto = new day0322_carDto();
	
	dto.setCarname(carname);
	dto.setCarprice(carprice);
	dto.setCarphoto(photo);
	dto.setGuipday(pur_date);
	
	day0322_carDao dao = new day0322_carDao();
	
	dao.insertCar(dto);
	
	response.sendRedirect("CarList.jsp");
%>
</body>
</html>