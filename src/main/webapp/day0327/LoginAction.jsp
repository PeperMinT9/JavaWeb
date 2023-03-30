<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String ID = request.getParameter("input_id");
	String PW = request.getParameter("input_pw");
	
	if (ID.equals("admin") && PW.equals("1234")) {
		session.setMaxInactiveInterval(60 * 60);
		session.setAttribute("loginstate", "yes");
		
		response.sendRedirect("AdminPage.jsp");
	}
	else{%>
		<script>
			alert("관리자 정보가 잘못되었습니다")
			history.back();
		</script>
	<%}	
%>