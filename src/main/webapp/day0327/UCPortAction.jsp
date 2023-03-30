<%@page import="study.dao.ChargerPortDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	try {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id").trim());
		int port_cnt = Integer.parseInt(request.getParameter("port_cnt").trim());
		int port_c = Integer.parseInt(request.getParameter("port_c").trim());
		int port_a = Integer.parseInt(request.getParameter("port_a").trim());
		String port_info = request.getParameter("port_info");
		System.out.println(port_cnt);
		System.out.println(port_c);
		System.out.println(port_a);
		System.out.println(port_info);
		
		ChargerPortDao dao = new ChargerPortDao();
		
		dao.updateChargerPort(id, port_cnt, port_c, port_a, port_info);
		
		response.sendRedirect("AdminPage.jsp");
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>