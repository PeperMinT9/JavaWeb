<%@page import="java.util.List"%>
<%@page import="study.dao.day0322_carDao"%>
<%@page import="study.dto.day0322_carDto"%>
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
	day0322_carDao dao = new day0322_carDao();
	List<day0322_carDto> list = dao.getAllCars();
	int list_length = list.size();
%>
<body>
	<script type = "text/javascript">
    	function del(num) {
    		let d = confirm("삭제하려면 확인을 눌러주세요")
    		if(d) {
    			location.href = "DeleteCar.jsp?num=" + num
    		}
    	}
    	
    	function detail(carphoto, name, price, date) {
    		$("div.modal-body img").attr("src", "../image/" + carphoto)
            // $("div.modal-body b").text(name + ", " + price + ", " + date)
            console.log("--detail")
    	}
    	
    	function chn(num) {
    		
    	}
    	
    </script>
	<h1 style = "text-align: center; width: 850px;">차량 조회</h1>
	<h3 style = "text-align: center; width: 850px;"><%=list_length%>종류의 차량이 존재합니다</h3>
    <table class = "table table-bordered" style = "width: 850px;">
        <tr>
            <th style = "width: 50px">번호</th>
            <th style = "width: 100px">차이름</th>
            <th style = "width: 100px">차가격</th>
            <th style = "width: 200px">차사진</th>
            <th style = "width: 100px">구입일자</th>
            <th style = "width: 100px">데이터 상세</th>
            <th style = "width: 100px">데이터 삭제</th>
            <th style = "width: 100px">데이터 수정</th>
        </tr>
        <%
            for(day0322_carDto dto: list) { %>
            	<tr>
            		<td><%=dto.getNum()%></td>
            		<td><%=dto.getCarname()%></td>
            		<td><%=dto.getCarprice()%></td>
            		<td><img src= "../image/<%=dto.getCarphoto()%>"  style= "width: 150px"></td>
            		<td><%=dto.getGuipday()%></td>
            		<td><button type = "button" class = "btn btn-success btn-sm"
						data-bs-toggle="modal" data-bs-target="#CarModal"
						onclick="detail(<%=dto.getCarphoto()%>, <%=dto.getCarname()%>, <%=dto.getCarprice()%>, <%=dto.getGuipday()%>)">
						상세</button></td>
            		<td><button type = "button" class = "btn btn-success btn-sm"
						onclick="del(<%=dto.getNum()%>)">삭제</button></td>
            		<td><button type = "button" class = "btn btn-success btn-sm"
						onclick="chn(<%=dto.getNum()%>)">수정</button></td>
            	</tr>
            <%}%>
        
    </table>
    
    <!-- The Modal -->
    <div class="modal" id="CarModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">상품상세보기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <img src="" class="modal-photo" style="width: 90%;" alt="사진나오는곳">
                    <br>
                    <h3 class="modal_title"><b>제품 제목...</b></h3>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
    
    
</body>
</html>