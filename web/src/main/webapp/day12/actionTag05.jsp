<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- actionTag05.jsp에서 n1 파라미터 값을 가져와 화면에 출력하는 코드 작성하기 -->
<%
	String n1 = request.getParameter("n1");
%>

	<h3>actionTag05.jsp</h3>
	<div><%= n1 %></div>

	
</body>
</html>