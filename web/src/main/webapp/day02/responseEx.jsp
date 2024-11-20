<%@page
	import="jakarta.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseEx.jsp</title>
</head>
<body>
	<%
	// HTTP 상태(status)
	// 200 : 정상
	// 404 : NOT Found (해당 문서가 없는 경우)
	// 405 : 요청방식을 처리 할 메서드가 없는 경우 doGet(), doPost() 메서드 지원하지 못할 때
	// 500 : server side logic error(코드 에러)
	int status = response.getStatus();

	out.println("<h3> status : " + status + "</h3>");
	%>

	<h2>다른 페이지 이동</h2>
	<ol>
		<li>forward</li>
		<%
		/* RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		rd.forward(request, response); */
		%>

		<li>redirect</li>
		<%
		// 다시 접속하는 것과 동일한 효과
		response.sendRedirect("menu.jsp");
		%>
	</ol>
</body>
</html>