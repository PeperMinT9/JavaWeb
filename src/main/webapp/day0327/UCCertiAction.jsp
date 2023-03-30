<%@page import="study.dao.ChargerCertiDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	try {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id").trim());
		String port_certi = request.getParameter("port_certi");
		
		ChargerCertiDao dao = new ChargerCertiDao();
		
		dao.updateChargerCerti(id, port_certi);
		
		response.sendRedirect("AdminPage.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>