<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Index.jsp</title>
	</head>
	<body>
		<% 
			// 여기는 자바 영역이된다 ..scriptlet이라 한다
			// 이곳에서 선언하는 변수는 지역변수가 된다
			// 그래서 선언후 그 아래에서만 가능하다
			String name = "홍무개";
			int year = 2010;

			out.print("<h2>내 이름은 " + name + "이고 " + year + "년생입니다</h2>");		
		%>	
		<!-- 선언문의 변수나 메서드 호출은 위치가 상관없다 -->
		<%=getAddress()%><br>
		<%=address%><br>
		<%=MESSAGE%><br>
		
		
		<!-- 표현식을 이용해서 자바영역의 변수 출력이 가능하다 -->
		<h2>내 이름은 <%=name%> 이고 <%=year%> 년생입니다</h2>
		<!-- 클래스 멤버변수나 메서드를 선언하려면 선언문을 사용하여야 한다 -->
		<%!
			// 이곳에서 선언한 변수나 메서드는 멤버로 구현된것이므로
			// 위치 상관없이 어디서든 호출이 가능하다
			final static String MESSAGE = "Bitcamp 701";
			String address = "강남구 역삼동";
			
			public String getAddress() {
				return "우리집은 " + address;
			}
		%>
	</body>


</html>