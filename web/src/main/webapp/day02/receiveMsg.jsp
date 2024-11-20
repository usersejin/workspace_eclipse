<!-- input 에 입력값 받아오기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiveMsg.jsp</title>
</head>
<body>
	<h2>receiveMsg.jsp</h2>
	<%
	// 따로 선언하지 않아도 쓸 수 잇는 변수
	// 모든 코드 ==> _jspService()

	// 지역변수 ==> 미리 선언되어잇음
	// JSP 내장객체
	// 요청객체 : request
	// 응답객체 : response
	// 출력 : out

	String msg = request.getParameter("msg");

	// 브라우저 h2 태그 출력
	out.println("<h2>" + msg + "</h2>");
	%>

</body>
</html>