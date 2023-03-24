<%@page import="study.dto.PersonDto"%>
<%@page import="study.dao.PersonDao"%>
<%@page import="java.util.Date"%>
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
<%
	// 목록에서 보내는 num 읽기
	int num = Integer.parseInt(request.getParameter("num"));
	// dao 선언
	PersonDao dao = new PersonDao();
	// dto 얻기
	PersonDto dto = dao.getData(num);
%>
<body>
	<h4 class = "alert alert-info" style = "width: 400px">Mysql Person 데이터 수정</h4>
	<form action = "personupdateaction.jsp" method = "post">
		<!-- hidden -->
		<input type = "hidden" name = "num" value = "<%=dto.getNum()%>">
		
		<table class = "table table-bordered" style = "width: 400px">
			<tr>
				<th bgcolor = "lightgray" width = "120">이 름</th>
				<td>
					<input type = "text" name = "name" required = "required"
					class = "form-conntrol" value="00.jpg">
				</td>
			</tr>
			<tr>
				<th bgcolor = "lightgray" width = "120">태어난 년도</th>
				<td>
					<select class = "form-selector" name = "birthyear">
						<%
							Date date = new Date();
							int currYear = date.getYear() + 1900;
							
							for(int i = currYear; i >= 1950; i--) {
								if(i == dto.getBirthyear()) {%>
									<option value = "<%=i %>" selected><%=i %></option>
								<%}
								else {%>
									<option value = "<%=i%>" ><%=i%></option>
								<%}
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th bgcolor = "lightgray" width = "120">주소</th>
				<td>
					<input type = "text" name = "address" class = "form-control"
					value="<%=dto.getAddress()%>">
				</td>
			</tr>
			<tr>
				<th bgcolor = "lightgray" width = "120">직업</th>
				<td>
					<select class = "form-select" name = "job">
					<%
						String[] job = {"공무원", "회사원", "영화배우", "가수", "개발자", "교사"};
					
						for(String j: job) { %>
							<option value = "<%=j %>" <%=j.equals(dto.getJob()) ? "selected" : ""%>><%=j %></option>
						<%}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th bgcolor = "lightgray" width = "120">사진</th>
				<td>
					<div class = "input-group">
						<select class = "form-select" name = "photo" id = "photo">
						<%
							for(int i = 0; i < 20; i++) { 
								String s = "0" + i + ".jpg"; %>
								<option value = "<%=i %>" <%=s.equals(dto.getPhoto()) ? "selected" : ""%>><%=i %></option>
							<%} %>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th bgcolor = "lightgray" width = "100">이메일</th>
				<td>
					<div class = "input-group">
						<input type = "text" name = "email1" style = "width: 120px" class = "form-control">
						<b>@</b>
						<select class = "form-select" name = "email2">
							<option value = "naver.com">네이버</option>
							<option value = "gmail.com">구글</option>
							<option value = "nate.com">네이트</option>
							<option value = "daum.com">다음</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<button type = "submit" class = "btn btn-success">데이터 수정</button>
				</td>
			</tr>
		</table>
	</form>
	<img src = "../image/<%=dto.getPhoto() %>" id = "photoview" width = "200" border = "1"
		style = "position: absolute; left: 400px; top: 100px">
		
	<script type="text/javascript">
		$("#photo").change(function() {
			let src = $(this).val()
			$("#photoview").attr("src", "../image/" + src)
		})
	</script>
</body>
</html>