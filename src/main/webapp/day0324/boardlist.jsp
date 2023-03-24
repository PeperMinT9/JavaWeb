<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.SimpleBoardDao"%>
<%@page import="study.dto.SimpleBoardDto"%>
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
</head>
<style>
	a:hover {
		text-decoration: underline;
		background-color: yellow;
	}
	a:visited, a:link {
		color: black;
		text-decoration: none;
	}

</style>
<%
	// dao 선언
	SimpleBoardDao dao = new SimpleBoardDao();
	// 전체 글목록 가져오기
	List<SimpleBoardDto> list = dao.getAll();
	int list_length = list.size();
%>
<body>
<div style="margin: 30px 50px">
	<button type="button" class="btn btn-secondary" style="width: 120px;"
	onclick="location.href='boardform.jsp'">
	<i class="bi bi-pencil-fill"></i>&nbsp;&nbsp; 글쓰기</button>
	
	<table class="table table-bordered" style="width: 700px; margin: 20px 50px;">
		<caption align="top"><b>
		<%=list_length == 0? "Simple Board" : "총 " + list_length + "개의 글이 있습니다" %>
		</b></caption>
		<tr bgcolor="lightgray" style = "text-align: center;">
			<th width="50">번호</th>
			<th width="300">제목</th>
			<th width="100">작성자</th>
			<th width="70">작성일</th>
			<th width="50">조회</th>
		</tr>
		<%
		if(list_length == 0) { %>
			<tr height = "60">
				<td colspan="5" align="center" valign="middle">
					<b>게시글이 없습니다</b>
				</td>
			</tr>
		<%}
		else { 
			int i = 0; 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.");
			for(SimpleBoardDto dto: list) { %>
				<tr>
					<td align = "center"><%=list_length - i++ %></td>
					<td>
						<a href = "detailboard.jsp?num=<%=dto.getNum()%>" 
						">
						<%=dto.getSubject()%>&nbsp;&nbsp;
						<%=dto.getPhoto() == null? "": "<i class='bi bi-image'></i>" %></a>
					</td>
					<td align = "center"><%=dto.getWriter()%></td>
					<td align = "center"><%=sdf.format(dto.getWriteday())%></td>
					<td align = "center"><%=dto.getReadcount()%></td>
				</tr>
			<%}
		}%>
	</table>
</div>
</body>
</html>