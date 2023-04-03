<%@page import="org.json.simple.JSONObject"%>
<%@page import="study.dto.SawonDto"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="study.dao.SawonDao2"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	int select = Integer.parseInt(request.getParameter("select"));

	SawonDao2 dao = new SawonDao2();
	
	List<SawonDto> list = dao.getSelected(select);
	
	JSONArray arr = new JSONArray();
	for(SawonDto dto: list) {
		JSONObject ob = new JSONObject();
		
		ob.put("name", dto.getName());
		ob.put("score", dto.getScore());
		ob.put("gender", dto.getGender());
		ob.put("buseo", dto.getBuseo());
		
		arr.add(ob);
	}
%>

<%=arr.toString()%>