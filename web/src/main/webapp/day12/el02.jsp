<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el02.jsp</title>
</head>
<body>

<%
	// el은 아래 코드 없어 ${} 로 바로 쓸 수 있음
	// if ( n != null) ~ 이런거 없이 값이 있으면 출력하고 없으면 존재하지 않는 것처럼 취급함 -> 코드를 절약할 수 있음
	// String n = request.getParameter("no");
	// <h3>전달 받은 값 : <%= n > </h3>

%>
	<h3>전달 받은 값 : ${param.no}</h3>
	
	<h3>전달 받은 값 : ${param.id}</h3>
	
	<h3>계산값 : ${100+200}</h3>

</body>
</html>