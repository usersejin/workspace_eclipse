<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag01.jsp</title>
</head>
<body>

<!-- 	<jsp:XXXXX> JSP Action Tag </jsp:XXXXX>
	어떤 동작을 하도록 약속되어진 태그 -> 실행결과를 현재 페이지에 포함시킴 
	<jsp:include page="test.jsp"></jsp:include>
	forward1.jsp 파일을 만들고 h2 태그로 forward1.jsp 입니다.
	실행시 forward1.jsp 파일로 이동 
	<jsp:include page="forward1.jsp"></jsp:include>
	
-->
	
	<%
		// RequestDispatcher rd = request.getRequestDispatcher("forward1.jsp");
	
		// rd.forward(request, response);
	
	%>
	
</body>
</html>