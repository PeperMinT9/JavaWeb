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
<body>
	<h4 class = "alert alert-info" style = "width: 500px">Mysql mycar 데이터 추가</h4>
	<form action = "AddCar.jsp" method = "post">
		<table class = "table table-bordered" style = "width: 500px">
			<tr>
	            <th style = "background-color: lightblue">차이름</th>
	            <td><input type="text" name = "carname"></td>
			</tr>
	        <tr>
	            <th style = "background-color: lightblue">차가격</th>
	            <td><input type="text" name = "carprice"></td>
	        </tr>
	        <tr>
	            <th style = "background-color: lightblue">차사진</th>
	            <td>
	                <select class="form-select" name = "photo" id = "photo">
	                    <%
	                        for(int i = 0; i < 7; i++) { %>
	                            <option value = "0<%=i%>.jpg"><%=i + 1%>번 사진</option>
	                        <%}%>
	                </select>
	            </td>
	        </tr>
	        <tr>
	            <th style = "background-color: lightblue">구입일자</th>
	            <td><input type="date" value="2023-01-01" name = "pur_date" ></td>
	        </tr>
	        <tr>
				<td colspan = "2" align = "center">
					<button type = "submit" class = "btn btn-success">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
	<img src = "../image/00.jpg" id = "photoview" width = "200"
		style = "position: absolute; left: 501px; top: 90px">
	<script>
		$("#photo").change(function () {
			let src = $(this).value
			$("#photoview").attr("src", src)
		})
		
		$(".btn").click(function () {
			
		})

	</script>
</body>
</html>