<?xml version="1.0" encoding="UTF-8"?>
<%@page import="study.dto.PersonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.PersonDao"%>
<%@ page language="java" contentType="text/xml; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	// 보내온 data를 읽는다
	// list()함수에서 호출된 경우는 name 값이 넘어오지 않는다
	String name  = request.getParameter("name");

	PersonDao dao = new PersonDao();
	List<PersonDto> list = null;
	
	if(name == null)
		list = dao.getAllPerson();
	else
		list = dao.getSearchNamePerson(name);
%>

<person>
<%
	for(PersonDto dto: list) { %>
		<data>
			<name num = "<%=dto.getNum() %>" photo="<%=dto.getPhoto() %>"><%=dto.getName()%></name>
			<birthyear><%=dto.getBirthyear() %></birthyear>
			<address><%=dto.getAddress() %></address>
			<job><%=dto.getJob() %></job>
		</data>
	<%}
%>
</person>