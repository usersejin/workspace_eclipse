<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugudan.jsp</title>
</head>
<body>
	<!-- HTML 주석
	h1 태그로 구구단 3단 출력
	표현식 : 실행결과로 하나의 값이 남는 문장 -->


	<%
	for (int i = 1; i < 10; i++) {
	%>
	<h1> 3 * <%=i%> = <%=i * 3%> </h1>
	<%
	}
	%>
</body>
</html>