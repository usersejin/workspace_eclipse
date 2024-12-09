<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl01.jsp</title>
</head>
<body>
	<!-- 액션 태그 : 태그로 자바의 문법적 기능을 수행 -->
	<%
		// JSTL(Java Standard Tag Library) : 자바에서 쓸 수 있는 표준 태그들을 모아 놓은 것
		// 1. 간단한 프로그램 로직 구사
		// 2. for문, if 문 태그 지원
		// 3. 날짜 시간 숫자 형식
		// 4. 데이터베이스의 입출력
		// 5. xml 문서의 처리
		// 6. jakarta.servlet.~ jar 파일
		
		// 요청객체의 num1이라는 속성에 300 이라는 값을 담음
		// request.setAttribute("num1", "300");
		// request.setAttribute("num2", "200");
	
	%>
	
	<!-- request.setAttribute("num1", "300");와 같은 의미 
		 scope="request" request 객체에 담음 -->
	<%-- <c:~ jar 파일과 <%@ taglib prefix="c" ~ 로 가능해짐 --%>
	<c:set var="num1" value="300" scope="request"></c:set>
	<c:set var="num2" value="200" scope="request"></c:set>
	
	<!-- 두 수의 합을 jstl02.jsp에 h3 태그로 출력 -->
	<jsp:forward page="jstl02.jsp"/>
	<!-- rd.forward(requestl, response); -->
	
</body>
</html>