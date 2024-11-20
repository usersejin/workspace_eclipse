<!-- request 객체의 주요 메서드 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestEx.jsp</title>
</head>
<body>
	<%
	// HttpServletRequest request

	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// get, post 방식 뭐 쓰는지
	String method = request.getMethod();

	// ip 가 뭔지
	String ip = request.getRemoteAddr();

	// QueryString
	String queryString = request.getQueryString();
	
	// url
	StringBuffer url = request.getRequestURL();

	// uri
	String uri = request.getRequestURI();

	out.println("<h2> method: " + method + "</h2>");
	out.println("<h2> ip: " + ip + "</h2>");
	out.println("<h2> QueryString: " + queryString + "</h2>");
	%>
</body>
</html>