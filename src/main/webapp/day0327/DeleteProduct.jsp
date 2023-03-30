<%@page import="study.dao.ChargerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num 읽기
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	// dao
	ChargerDao dao = new ChargerDao();
	
	dao.deleteCharger(id);
	// 목록으로 이동
	response.sendRedirect("AdminPage.jsp");

%>