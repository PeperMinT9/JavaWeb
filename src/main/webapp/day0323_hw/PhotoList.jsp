<%@page import="java.util.List"%>
<%@page import="study.dto.PhotoDto"%>
<%@page import="study.dao.PhotoDao"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<% 
    PhotoDao dao = new PhotoDao();
    List<PhotoDto> list = dao.getAllPhoto();
    int list_length = list.size();
%>
<body>
    <h1 style="text-align: center; width: 800px;">사진 목록</h1>
    <h3 style="text-align: center; width: 800px;"><%=list_length%>개의 목록</h3>
    <table>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>사진가격</th>
            <th>사진</th>
            <th>개시날짜</th>
            <th>상세</th>
            <th>삭제</th>
        </tr>
        <%
            for(PhotoDto dto: list) { %>
                <tr>
                    <td><%=dto.getIdx()%></td>
                    <td><%=dto.getPhoto_name()%></td>
                    <td><%=dto.getPhoto_price()%></td>
                    <td><img src="../image/<%=dto.getPhoto_img()%>" style="width: 150px;"></td>
                    <td><%=dto.getPub_date()%></td>
                    <td><button class="btn btn-success">상세</button></td>
                    <td><button class="btn btn-danger">삭제</button></td>
                </tr>
            <% }
        %>
    </table>
</body>
</html>