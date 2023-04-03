<%@page import="study.dao.day0322_carDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	day0322_carDao dao = new day0322_carDao();
	
	// 삭제
	dao.deleteCar(num);
%>