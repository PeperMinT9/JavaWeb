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
	
</style>
<%
	boolean b = false; // amho 쿠키가 존재하면 true 변경
	// 브라우저에 저장된 모든 쿠키값들을 얻는다
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		int cl = cookies.length;
		for(int i = 0; i < cl; i++) {
			String cname = cookies[i].getName();
			String cvalue = cookies[i].getValue();
			if(cname.equals("amho") && cvalue.equals("1234")) {
				// amho 쿠키가 존재하므로 b를 true로 변경한다
				b = true;
			}
		}
	}
%>
<body>
<%
	if(b) { %>
<pre>
	(서울=연합뉴스) 차병섭 기자 = 인플레이션(물가 상승)과 잇따른 은행 파산 등 금융권 불안 사이에서 고민하던 미 연방준비제도(연준·Fed)가 기준금리를 0.25%포인트 올리면서 최근의 금융 불안에 대해 한차례 이상의 금리 인상과 맞먹는 영향이 있다고 평가했다.

	제롬 파월 연준 의장은 22일(현지시간) 연방공개시장위원회(FOMC) 정례회의 결과 만장일치로 기준금리 상단을 5.0%까지 끌어올린 뒤 기자회견을 통해 최근 경제상황과 관련해 이같이 밝혔다.

	연준은 이날 성명을 통해 "최근의 상황 전개는 가계와 기업의 신용 여건을 빡빡하게 만들고 경제활동과 고용, 인플레이션을 압박할 수 있다"면서 "이러한 영향의 정도는 불명확하다"고 평가했다.

</pre>
<%
	} 
	else { %>
		<script type = "text/javascript">
			alert("먼저 로그인후 기사를 확인하세요");
			history.back();
		</script>
	<%}%>
</body>
</html>