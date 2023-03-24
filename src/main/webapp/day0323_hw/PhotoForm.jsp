<%@page import="study.dto.PhotoDto"%>
<%@page import="study.dao.PhotoDao"%>
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
</body>
    <h4 class = "alert alert-info" style = "width: 500px">Mysql myphoto 데이터 추가</h4>
    <form action="AddPhoto.jsp" method="post">
        <!-- hidden -->
		<input type="hidden" name="message" value="Happy Day!">
        <table class="table table-bordered" style="width: 450px">
            <tr>
                <th>사진이름</th>
                <td>
                    <input type="text" name="photo_name" required="required" class="form-control">
                </td>
            </tr>
            <tr>
                <th>사진가격</th>
                <td>
                    <input type="text" name="photo_price" required="required" class="form-control">
                </td>
            </tr>
            <tr>
                <th>사진</th>
                <td>
                    <select name="photo_img" id="img">
                        <%
                            for(int i = 0; i < 20; i++) { %>
                                <option value = "<%=(i > 9)? i : ("0" + i)%>.jpg"><%=(i > 9)? i : ("0" + i)%>번 사진</option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <th>개시날짜</th>
                <td>
                    <input type="date" name="pub_date" required="required" class="form-control">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="align-content: center;">
                    <button id = "btnAdd" >추가</button>
                </td>
            </tr>
        </table>
    </form>
    <img src = "../image/00.jpg" id = "photoview" style = "width: 300px; position: absolute; left: 460px; top: 100px;">
    <script>
        $("#img").change(function () {
            let src = $(this).val()
            $("#photoview").attr("src", "../image/" + src)
        })
    </script>
</html>