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
	div.information_sheet {
		float: left;
	}
</style>
<%
	
%>
<body>
	<h1>새로운 충전기 정보 입력</h1>
	<button onclick = "history.back()">취소후 뒤로가기</button><br>
	<div class = "information_sheet">
		<form action = "AddAction.jsp" method = "post" enctype = "multipart/form-data">
			<table style = 'width: 500px; padding: 5px 20px 5px 5px;' class = 'table table-bordered'>
				<tr>
					<th>제품명</th>
					<td><input type = 'text' required = 'required' name = 'name'></td>
				</tr>
				<tr>
					<th>총출력</th>
					<td><input type = 'number' required = 'required' name = 'max_watt'></td>
				</tr>
				<tr>
					<th>제품 사진</th>
					<td><input type = 'file' id = 'file_selector' class = 'form-control' name = 'img_src'></td>
				</tr>
				<tr>
					<th>포트수</th>
					<td><input type = 'number' name = 'port_cnt'></td>
				</tr>
				<tr>
					<th>C 타입 포트</th>
					<td><input type = 'number' name = 'port_c'></td>
				</tr>
				<tr>
					<th>A 타입 포트</th>
					<td><input type = 'number' name = 'port_a'></td>
				</tr>
				<tr>
					<th>출력 지원</th>
					<td><input type = 'text' name = 'port_info'></td>
				</tr>
				<tr>
					<th>인증 정보</th>
					<td><input type = 'text' name = 'port_certi'></td>
				</tr>
			</table>
			<button type = "submit" class = "btn btn-success">추가하기</button>
		</form>
		
	</div>
	<img id = "result_img" src="../image/00.jpg">
	
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