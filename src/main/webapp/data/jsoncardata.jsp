<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="study.dto.day0322_carDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.day0322_carDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	day0322_carDao dao = new day0322_carDao();
	List<day0322_carDto> list = dao.getAllCars();
	
	JSONArray arr = new JSONArray();
	
	for(day0322_carDto dto: list) {
		JSONObject ob = new JSONObject();
	    ob.put("num", dto.getNum());
	    ob.put("carname", dto.getCarname());
	    ob.put("carprice", dto.getCarprice());
	    ob.put("carphoto", dto.getCarphoto());
	    ob.put("guipday", dto.getGuipday());
	    
	    arr.add(ob);
	}
%>

<%=arr.toString()%>