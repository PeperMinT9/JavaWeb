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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.shopadd {
		cursor: pointer;
		color: red;
		font-size: 30px;
	}
	
	.box {
		width: 30px; height: 20px;
		border: 1px solid black;
		margin-left: 50px;
	}
	
	.iupdate, .idelete {
		cursor: pointer;
		font-size: 20px;
	}
	
	.iupdate {
		color: green;
	}
	
	.idelete {
		color: red;
		margin-left: 30px;
	}
</style>
<script>
	$(function() {
		// 처음시작시 목록 출력
		list();
		
		// 검색후 엔터 또는 검색버튼 클릭시 list 다시 호출
		$('#btnsearch').click(function() {
			list();
		})
		
		$('#search').keyup(function(e) {
			if(e.keyCode == 13) {
				list();
			}
		})
		
		$('#nphoto').change(function() {
			$('#photoview').attr("src", "../../image/" + $(this).val())
		})
		
		// 단가 입력후 포커스가 벗어날때 숫자인지 아닌지 체크
		$('#ndan').blur(function() {
			if(isNaN($(this).val())) {
				alert("단가는 숫자로만 입력해주세요")
				$(this).val("")
				$(this).focus()
			}
		})
		
		// 상품등록버튼
		$('#btnadd').click(function() {
			// 모달폼에서 입력한 값들을 읽어온다
			let sang = $('#nsangpum').val()
			let color = $('#ncolor').val()
			let su = $('#nsu').val()
			let dan = $('#ndan').val()
			let ipgoday = $('#nipgoday').val()
			let photo = $('#nphoto').val()
			
			$.ajax({
				type: "get",
				url: "../shopback/insertShop.jsp",
				data: {"sangpum" : sang, "color" : color, "su" : su, 
					"dan" : dan, "ipgoday" : ipgoday, "photo" : photo},
				dataType: "json",
				success: function(res) {
					// 현재 페이지 새로고침
					location.reload();
				},
				statusCode: {
					404: function() {
						alert("파일이 없어요")
					},
					500: function() {
						alert("서버 오류.. 다시한번 코드를 확인하세요")
					}
				}
			})
		})
		
		// 수정 아이콘 클릭시 모달창에 데이터 넣기 $(document).on 사용
		$(document).on("click", ".iupdate", function() {
			let num = $(this).attr("num");
			$.ajax({
				type: "get",
				url: "../shopback/selectdata.jsp",
				data: {"num" : num},
				dataType: "json",
				success: function(res) {
					$("#unum").val(res.num)
					$("#usangpum").val(res.sangpum)
					$("#uphoto").val(res.photo)
					$("#usu").val(res.su)
					$("#udan").val(res.dan)
					$("#uipgoday").val(res.ipgoday)
					$("#ucolor").val(res.color)
					
					// 사진
					$("#uphotoview").attr("src", "../../image/" + res.photo)
				},
				statusCode: {
					404: function() {
						alert("파일이 없어요")
					},
					500: function() {
						alert("서버 오류.. 다시한번 코드를 확인하세요")
					}
				}
			})
		})
		
		// 수정버튼 클릭시
		$('#btnupdate').click(function() {
			// form의 입력 데이터를 한꺼번에 가져온다
			// 단 form안에서 줘야하고 태그에서는 name을 줘야한다
			let data = $('#frmupdate').serialize()
			alert(data)
			$.ajax({
				type: "get",
				url: "../shopback/updateShop.jsp",
				data: data,
				dataType: "html",
				success: function(res) {
					// 화면 새로고침
					// location.reload()
					// 목록만 다시 출력
					list();
				}
			})
		})
		
		$(document).on('click', '.idelete', function() {
			let num = $(this).attr('num');
			// alert(num)
			
			let b = confirm('삭제하려면 [확인]을 눌러주세요')
			if(b) {
				$.ajax({
					type: "get",
					url: "../shopback/deleteShop.jsp",
					data: 'num=' + num,
					dataType: "html",
					success: function(res) {
						list();
					}
				})
			}
		})
	})
	
	function list() {
		// search 값 읽기
		let search = $('#search').val();
		
		$.ajax({
			type: "get",
			url: "../shopback/listshop.jsp",
			data: {"search" : search},
			dataType: "json",
			success: function(res) {
				let s = "총 " + res.length + " 개의 상품이 검색되었습니다<br><br>";
				s += '<table class = "table table-bordered">'
				
				$.each(res, function(idx, element) {
					s += `
						<tr>
							<td>
								<img src='../../image/\${element.photo}' style = 'width: 200px; height 240px; border: 1;'>
							</td>
							<td valign = 'middle'>
								<i class = "bi bi-pencil-square iupdate" num = "\${element.num}" data-toggle="modal" data-target="#myUpdateModal"></i>
								<i class = "bi bi-trash idelete" num = "\${element.num}"></i>
								<br><br>
								상품명: \${element.sangpum}<br>
								색상: <div class = 'box' style = 'background-color: \${element.color}'></div>
								수량: \${element.su}<br>
								단가: \${element.dan}<br>
								입고일: \${element.ipgoday}
							</td>
						</tr>
					`
				})
				
				s += '</table>'
				$(".list").html(s);
			},
			statusCode: {
				404: function() {
					alert("파일이 없어요")
				},
				500: function() {
					alert("서버 오류.. 다시한번 코드를 확인하세요")
				}
			}
		})
	}
	
</script>
</head>
<body>

	<!-- Modal -->
	<div class="modal fade" id="myShopModal" role="dialog">
		<div class="modal-dialog">
	  
			<!-- 추가용 모달 -->
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        		<h4 class="modal-title">상품등록</h4>
	      		</div>
	      
	      		<div class="modal-body">
	        		<table class = 'table table-bordered'>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>상품명</th>
	        				<td>
	        					<input type = 'text' id = 'nsangpum' class = 'form-control'>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>사진</th>
	        				<td class = 'input-group'>
	        					<select id = 'nphoto'>
	        					<%
	        					for(int i = 0; i < 20; i++) {
	        						String fname = (i < 10? "0" + i : i) + ".jpg"; %>
	        						<option value = "<%=fname%>"><%=fname%></option>
	        					<%}
	        					%>
	        					</select>
	        					&nbsp;&nbsp;
	        					<img src = "../../image/00.jpg" width = "50px" height = "50px" border = "1" hspace = "3" id = 'photoview'>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>수량</th>
	        				<td>
	        					<input type = 'number' id = 'nsu' class = 'form-control' min = '1' max = '5' value = '1'>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>단가</th>
	        				<td>
	        					<input type = 'text' id = 'ndan' class = 'form-control'>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>색상</th>
	        				<td>
	        					<input type = 'color' id = 'ncolor' class = 'form-control' value = '#ccfdab'>
	        				</td>
	        			</tr>
	        			<tr>
	        				<th style = 'background-color: #ccc; width: 80px;'>입고일</th>
	        				<td>
	        					<input type = 'date' id = 'nipgoday' class = 'form-control'>
	        				</td>
	        			</tr>
	        			
	        		</table>
	      		</div>
	      
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal" id = 'btnadd'>등록</button>
	      		</div>
	    	</div>	
	  	</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myUpdateModal" role="dialog">
		<div class="modal-dialog">
	  
			<!-- 업데이트용 모달 -->
	    	<div class="modal-content">
	    		<form id = 'frmupdate'>
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal">&times;</button>
		        		<h4 class="modal-title">상품등록</h4>
		      		</div>
		      
		      		<div class="modal-body">
		      			<input type="hidden" name="num" id="unum" value="">
		        		<table class = 'table table-bordered'>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>상품명</th>
		        				<td>
		        					<input type = 'text' id = 'usangpum' class = 'form-control' name = 'sangpum'>
		        				</td>
		        			</tr>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>사진</th>
		        				<td class = 'input-group'>
		        					<select id = 'uphoto' name="photo" class="form-select">
		        					<%
		        					for(int i = 0; i < 20; i++) {
		        						String fname = (i < 10? "0" + i : i) + ".jpg"; %>
		        						<option value = "<%=fname%>"><%=fname%></option>
		        					<%}
		        					%>
		        					</select>
		        					&nbsp;&nbsp;
		        					<img src = "../../image/00.jpg" width = "50px" height = "50px" border = "1" hspace = "3" id = 'uphotoview'>
		        				</td>
		        			</tr>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>수량</th>
		        				<td>
		        					<input type = 'number' id = 'usu' class = 'form-control' min = '1' max = '5' value = '1' name="su">
		        				</td>
		        			</tr>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>단가</th>
		        				<td>
		        					<input type = 'text' id = 'udan' class = 'form-control' name="dan">
		        				</td>
		        			</tr>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>색상</th>
		        				<td>
		        					<input type = 'color' id = 'ucolor' class = 'form-control' value = '#ccfdab' name="color">
		        				</td>
		        			</tr>
		        			<tr>
		        				<th style = 'background-color: #ccc; width: 80px;'>입고일</th>
		        				<td>
		        					<input type = 'date' id = 'uipgoday' class = 'form-control' name="ipgoday">
		        				</td>
		        			</tr>
		        			
		        		</table>
		      		</div>
		      
		      		<div class="modal-footer">
		        		<button type="submit" class="btn btn-default" data-dismiss="modal" id = 'btnupdate'>수정</button>
		      		</div>
	      		</form>
	    	</div>
  		
	  	</div>
	</div>

	<div class = 'search input-group' style = 'margin: 30px 50px'>
		<input type = 'text' id = 'search' placeholder = '검색할 상품명을 입력하세요' style = 'width: 300px'>
		<button class = 'btn btn-danger btn-sm' id = 'btnsearch'>검색</button>
		&nbsp;&nbsp;
		<i class="bi bi-bag-plus shopadd" data-toggle="modal" data-target="#myShopModal"></i>
	</div>
	
	<div class = 'list' style = 'magin: 30px 50px;'>
	
	</div>
</body>
</html>