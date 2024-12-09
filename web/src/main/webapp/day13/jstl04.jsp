<!-- jstl로 if문 삼항연산자 만들기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl04.jsp</title>
</head>
<body>

	<!-- 1. el 출력 -->
	<h3>${ (param.no1 > param.no2)? param.no1 : param.no2 }</h3>
	<!-- 2. jstl 출력 
		 1) taglib를 추가
		 2) prefix 명-->
	<c:if test="${param.no1 > param.no2 }">
		<h3>${param.no1 }이 더 크다.</h3>
	</c:if>
	
	<c:if test="${param.no1 < param.no2 }">
		<h3>${param.no2 }이 더 크다.</h3>
	</c:if>
	

</body>
</html>