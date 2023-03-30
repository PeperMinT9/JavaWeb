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
<style>
	div.container {
		position: absolute;
		left: 400px;
		top: 130px;
	}
	
	div.col {
		width: 400px;
	}

</style>

</head>

<body>
	<form action="LoginAction.jsp" method = "post">
		<div class = 'container'>
			<div class = 'col' span = 2>
				로그인 페이지입니다
			</div>
			<div class = 'col'>
				<div>ID</div>
				<div><input name = 'input_id' type = 'text' class= "form-control"></div>
			</div>
			<div class = 'col'>
				<div>PW</div>
				<div><input name = 'input_pw' type = "password" class= "form-control"></div>
			</div>
			<div class = 'col' span = 2>
				<button type = 'submit'>로그인</button>
			</div>
		</div>
	</form>
</body>
</html>