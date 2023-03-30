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
 	th {
 		background-color: GRAY;
 		width: 150px;
 	}
 	td {
 		width: 350px;
 	}
 	div {
 		padding: 10px 10px 10px 10px;
 		border: 1px dashed green;
 		margin: 5px;
 	}
 	button.btn-dark {
 		postition: abslute;
 		top: 10px;
 		left: 300px;
 	}
 	
</style>
</head>
<%
	// dao 선언
	ChargerDao dao = new ChargerDao();
	// 목록에서 받아오기
	List<ChargerDto> list = dao.getAllCharger();
	int list_length = list.size();
%>
<body>
	<h1>접지 PD충전기 리스트 관리자 페이지</h1>
	<button type="button" id='btn_log_out' class = 'btn btn-dark' onclick="location.href='LogoutAction.jsp'">관리자 로그아웃</button>	
	<button type="button" id='btn_add' class = 'btn btn-primary' onclick="location.href='AddProduct.jsp'">추가</button>
	<%for(ChargerDto dto: list) { %>
		<div>
			<table class = 'table table-bordered'>
				<tr>
					<td colspan = '2'>
						<img src = "../save/<%=dto.getImg_src()%>" class = 'db_img' width = "400px">
					</td>
				</tr>
				<tr>
					<th>DB 내부 등록번호</th>
					<td class = 'db_id'><%=dto.getId()%></td>
				</tr>
				<tr>
					<th>제품명</th>
					<td class = 'db_name'><%=dto.getName()%></td>
				</tr>
				<tr>
					<th>총출력</th>
					<td class = 'db_mw'><%=dto.getMax_watt()%></td>
				</tr>
				<tr>
					<th>포트수</th>
					<td class = 'db_cnt'><%=dto.getPort_cnt()%></td>
				</tr>
				<tr>
					<th>C 타입 포트</th>
					<td class = 'db_pc'><%=dto.getPort_type_c()%></td>
				</tr>
				<tr>
					<th>A 타입 포트</th>
					<td class = 'db_pa'><%=dto.getPort_type_a()%></td>
				</tr>
				<tr>
					<th>출력 지원</th>
					<td class = 'db_info'><%=dto.getPort_info()%></td>
				</tr>
				<tr>
					<th>인증정보</th>
					<td class = 'db_certi'><%=dto.getCertification()%></td>
				</tr>
			</table>
			<button type="button" class = 'btn btn-secondary update_charger'>충전기정보 수정</button>
			<button type="button" class = 'btn btn-secondary update_charger_port'>포트정보 수정</button>
			<button type="button" class = 'btn btn-secondary update_charger_certi'>인증정보 수정</button>
			<button type="button" class = 'btn btn-danger btn_del'>삭제</button>
		</div>
	<%} %>
</body>
<script type = "text/javascript">
	function del(id) {
		let b = confirm("삭제를 하려면 확인을 눌러주세요");
		if(b) {
			location.href = "DeleteProduct.jsp?id=" + id;
		}
	}
	
	$('#btn_add').click(function () {
		console.log($(this).parent().val())
	})
	$('.update_charger').click(function () {
		location.href = "UpdateChargerProduct.jsp?id=" + $(this).siblings("table").find(".db_id").text() +
				"&name=" + $(this).siblings("table").find(".db_name").text() +
				"&max_watt=" + $(this).siblings("table").find(".db_mw").text() +
				"&img_src=" + $(this).siblings("table").find(".db_img").attr("src")
				 
	})
	$('.update_charger_port').click(function () {
		console.log($(this).find(".db_num").text())
		location.href = "UpdateChargerPort.jsp?id=" + $(this).siblings("table").find(".db_id").text() +
				"&port_cnt=" + $(this).siblings("table").find(".db_cnt").text() +
				"&port_c=" + $(this).siblings("table").find(".db_pc").text() +
				"&port_a=" + $(this).siblings("table").find(".db_pa").text() +
				"&port_info=" + $(this).siblings("table").find(".db_info").text()
	})
	$('.update_charger_certi').click(function () {
		console.log($(this).siblings("table").find(".db_num").text())
		location.href = "UpdateChargerCerti.jsp?id=" + $(this).siblings("table").find(".db_id").text() +
				"&port_certi=" + $(this).siblings("table").find(".db_certi").text()
	})
	$('.btn_del').click(function () {
		console.log($(this).siblings("table").find(".db_id").text())
		del($(this).siblings("table").find(".db_id").text())
	})
</script>
</html>