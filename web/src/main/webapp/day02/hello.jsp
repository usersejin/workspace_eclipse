<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	지시어(Directive)
	page Directive
	jsp 페이지는 서블릿으로 변환하는데 필요한 정보를 jsp 엔진에 알려줌
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- // 스트립트 요소(Script Elements)
	// 1. 선언부(Declaration) : 변수 선언
	// 2. 스트립트릿(Scriptlet) : 실행 코드 <% %>
	// 3. 표현식(Expression) :  -->
	
	<%
	/* 이 부분은 자바 코드입니다. */
	for (int i = 0; i < 100; i++) {
	%>
	<h3>hello jsp world!</h3>
	<%
	}
	%>

</body>
</html>