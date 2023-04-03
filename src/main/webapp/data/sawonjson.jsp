<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="study.dao.SawonDao"%>
<%@page import="study.dto.SawonDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String gender = request.getParameter("gender");
	System.out.println(gender);
	SawonDao dao = new SawonDao();
	List<SawonDto> list = new Vector<>();
	
	
	if (gender.equals("2")) {
		list = dao.getSelected("남자");
	}
	else if (gender.equals("3")) {
		list = dao.getSelected("여자");
	}
	else {
		list = dao.getSelected();
	}
	
	JSONArray arr = new JSONArray();
	
	for(SawonDto dto: list) {
		JSONObject ob = new JSONObject();
		ob.put("name", dto.getName());
		ob.put("score", dto.getScore());
		ob.put("gender", dto.getGender());
		ob.put("buseo", dto.getBuseo());
		
		arr.add(ob);
	}
	System.out.println(arr);
%>

<%=arr.toString()%>
