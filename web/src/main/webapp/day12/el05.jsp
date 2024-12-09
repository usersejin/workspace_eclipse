<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el05.jsp</title>
</head>
<body>
	<%
		// .setAttribute("속성명", 객체);
		pageContext.setAttribute("id1", "aaa"); 
		request.setAttribute("id1", "aaa"); 
		// 속성명은 같지만 대상이 달라서 가능하긴 해.. -> 그러면 el 에서 id1이 어떤건지 알 수 없게
		request.setAttribute("id2", "aaa");
		session.setAttribute("id3", "aaa");
		application.setAttribute("id4", "aaa");
	%>
	
	<a href="el06.jsp">자바 코드 이용한 페이지로 이동하기</a>
	<a href="el07.jsp">el 사용한 페이지로 이동하기</a>
	
	
</body>
</html>