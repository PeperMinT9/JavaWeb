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
	[세종=뉴시스]이승주 기자 = 이창양 산업통상자원부장관은 23일 이번 방일 관련 '굴욕외교'라는 비판을 부인하며 "오늘 중 일본의 (반도체 주요 3종품목) 수출규제 해제와 우리의 세계무역기구(WTO)제소를 동시에 철회할 예정"이라고 반박했다.

	이 장관은 이날 오전 국회에서 진행된 산업통상자원중소벤처기업위원회 전체회의에서 정일영 더불어민주당 의원의 질문에 이 같이 답했다.

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