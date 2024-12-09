<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl02.jsp</title>
</head>
<body>
<%
	/* Object n1 = request.getAttribute("num1");
	Object n2 = request.getAttribute("num2");
	
	if(n1 != null && n2 != null){
		String n3 = (String)n1;
		String n4 = (String)n2;
		
		int num1 = Integer.parseInt(n3);
		int num2 = Integer.parseInt(n4);
		out.println("<h3>" + (num1+num2) +"</h3>");
	} */



%>

	<hr/>
	
	<h3>${num1 + num2}</h3>

	<!-- 두 수 중 큰 값을 출력 -->
	<!-- 삼항연산자, if문 사용 가능 (but else if 는 안돼) -->
	<h3>${ (num1 > num2)? num1 : num2 }</h3>
	<c:if test="${num1 < num2 }">
		<h3>num1이 더 작다</h3>
	</c:if>
	
	<c:if test="${num2 < num1 }">
		<h3>num2이 더 작다</h3>
	</c:if>
</body>
</html>