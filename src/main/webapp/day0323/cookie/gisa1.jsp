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
	[파이낸셜뉴스]미국의 정책금리 인상으로 한·미 금리차가 1.50%p까지 벌어진 가운데 한국은행이 "국내외 금융시장 변동성이 수시로 확대될 수 있다"며 자본유출입 동향을 면밀히 모니터링하겠다고 23일 밝혔다.

	한국은행은 이날 이승헌 부총재 주재로 전날 미국 연방공개시장위원회(FOMC) 결과와 관련 시장상황 점검회의를 열고 국제금융시장 상황과 국내 금융·외환시장에 미칠 영향을 점검했다. 미 FOMC는 정책금리를 4.50~4.75%에서 4.75~5.00%으로 0.25%p 인상했다.

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