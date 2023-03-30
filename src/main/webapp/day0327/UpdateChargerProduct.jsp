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
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	int max_watt = Integer.parseInt(request.getParameter("max_watt"));
	String img_src = request.getParameter("img_src");
%>
<body>
	<button type="button" id="return_back" onclick = "history.back()" class = "btn btn-primary">뒤로가기</button>
	<br><br>
	<img id = "result_img" src = "" style = "width: 400px;">
	<form action = "UCProductAction.jsp" method = "post" enctype = "multipart/form-data">
		<!-- hidden -->
		<input type = "hidden" name = "id" value = "<%=id%>">
		<table>
			<tr>
				<th>제품명</th>
				<td><input type = "text" value = <%=name %> name = "name"></td>
			</tr>
			<tr>
				<th>총출력</th>
				<td><input type = "number" value = <%=max_watt %> name = "max_watt"></td>
			</tr>
			<tr>
				<th>제품 사진</th>
				<td><input type = 'file' id = 'file_selector' class = 'form-control' name = 'img_src'></td>
			</tr>
		</table>
		<button type = 'submit' class = 'btn btn-warning'>수정하기</button>
	</form>
	<script>
		$("#file_selector").change(function(){
			console.log("1:"+$(this)[0].files.length);
			console.log("2:"+$(this)[0].files[0]);
	
			//정규표현식
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
			var f = $(this)[0].files[0];//현재 선택한 파일
	
			if(!f.type.match(reg)){
				alert("확장자가 이미지파일이 아닙니다");
				return;
			}
	
			if($(this)[0].files[0]){
				var reader = new FileReader();
	
				reader.onload = function(e){
					$("#result_img").attr("src",e.target.result);
				}
	
				reader.readAsDataURL($(this)[0].files[0]);
			}
		});
	</script>
</body>
</html>