<%@page import="study.dao.ChargerCertiDao"%>
<%@page import="study.dao.ChargerPortDao"%>
<%@page import="study.dto.ChargerDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.ChargerDao"%>
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
 	
 	table {
 		width: 550px;
 	}
 	th {
 		background-color: GRAY;
 		width: 150px;
 	}
 	td {
 		width: 400px;
 	}
 	
 	div.charger {
 		padding: 8px 8px 8px 8px;
 		border: 1px dashed green;
 		margin: 5px;
 	}
 	
 	div.charger_content {
 		padding: 2px 2px 2px 2px;
 	}
 	
 	button.btn_admin {
 		postition: abslute;
 		top: 10px;
 		left: 300px;
 	}
 	button {
 		padding: 8px 8px 8px 8px;
 	}
 	


</style>
</head>
<%
	// dao 선언
	ChargerDao dao = new ChargerDao();
	ChargerPortDao pdao = new ChargerPortDao();
	ChargerCertiDao cdao = new ChargerCertiDao();
	// 목록에서 받아오기
	List<ChargerDto> list = dao.getAllCharger();
	String image_save_dir = "C:\\Users\\Admin\\Documents\\bit701naver\\javawork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\JavaWeb\\save\\";
%>
<body>
	<h1>접지 PD충전기 리스트</h1>
	<button type="button" id='btn_admin' class = 'btn btn-dark btn_admin' onclick="location.href='AdminLogin.jsp'">관리자페이지</button>	
	<%-- <button type="button" id='btn_admin' class = 'btn btn-dark btn_admin' onclick="<%list = dao.getAllCharger("max_watt > 150");%>, location.reload()">필터테스트</button>	
	<button type="button" id='btn_admin' class = 'btn btn-dark btn_admin' onclick="location.href='AdminLogin.jsp'">관리자페이지</button> --%>	
	<%for(ChargerDto dto: list) { %>
		<div class = "charger">
			<div class = "default charger_content">
				<table class = 'table table-bordered'>
					<tr>
						<td colspan='2'><img src="../save/<%=dto.getImg_src()%>" width = "400px"></td>
					</tr>
					<tr>
						<th>제품명</th>
						<td><%=dto.getName()%></td>
					</tr>
					<tr>
						<th>총출력</th>
						<td><%=dto.getMax_watt()%></td>
					</tr>
				</table>
			</div>
			<button class = "charger_info btn btn-info">포트정보</button>
			<button class = "charger_certi btn btn-warning">인증정보</button>
			<div class = "port_info charger_content" style = "display: none;">
				<table class = 'table table-bordered'>
					<tr>
						<th>포트수</th>
						<td><%=dto.getPort_cnt()%></td>
					</tr>
					<tr>
						<th>C 타입 포트</th>
						<td><%=dto.getPort_type_c()%>개</td>
					</tr>
					<tr>
						<th>A 타입 포트</th>
						<td><%=dto.getPort_type_a()%>개</td>
					</tr>
					<tr>
						<th>출력 지원</th>
						<td><%=dto.getPort_info().replace(",", "<br>")%></td>
					</tr>
				</table>
			</div>
			<div class = "port_certi charger_content" style = "display: none;">
				<table class = 'table table-bordered'>
					<tr>
						<th>인증정보</th>
						<td><%=dto.getCertification()%></td>
					</tr>
				</table>
			</div>
		</div>
	<%} %>
</body>
<script type = "text/javascript">
	$(".charger_info").click(function () {
		if ($(this).siblings(".port_info").css("display") == "none") {
			$(this).siblings(".port_info").css("display", "block")
			$(this).text("포트정보 숨기기")
		}
		else {
			$(this).siblings(".port_info").css("display", "none")
			$(this).text("포트정보")
		}
	})
	
	$(".charger_certi").click(function () {
		if ($(this).siblings(".port_certi").css("display") == "none") {
			$(this).siblings(".port_certi").css("display", "block")
			$(this).text("인증정보 숨기기")
		}
		else {
			$(this).siblings(".port_certi").css("display", "none")
			$(this).text("인증정보")
		}
	})

</script>
</html>