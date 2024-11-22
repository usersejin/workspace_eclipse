<!-- a.jsp 와 이어지나? -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp</title>
</head>
<body>
	<h3>파일을 가져오는 방법 2가지</h3>

	<!-- 이건 HTML 주석 => 페이지 소스 보기를 통해 보여짐 -->
	<%-- JSP 주석 => 페이지 소스 보기(사용자)를 통해 보여지지 않음 --%>

	<!-- 다른 파일을 현재 파일에서 사용하려면 불러와야 함 -->
	<!-- a.jsp 파일 불러오기 -->
	<%-- <!-- 첫번째 방법 :  include 디렉티브 태그 사용하기 -->
	
	-------------- 아래는 a.jsp 파일의 내용임 --------------
	<%@ include file = "a.jsp" %>
	
	<!-- 즉, include 지시자는 a.jsp 의 내용을 그대로 copy&paste하는 효과를 나타냄 --> --%>

	<!-- 두번째 방법 : jsp:include include 액션태그 사용하기 -->
	<%-- <jsp:XXXX => jsp 액션태그 --%>
	<jsp:include page="a.jsp"></jsp:include>


	<!-- 각 방법을 확인하기 위한 출력 -->
	<%
	// a 변수의 값을 출력
	// out.println(a); // 두번째 방법으로는 안돼, 왜냐면 변수가 선언이 되어있지 않으므로 
	%>

	<!-- jsp:include는 a.jsp 의 컴파일된 결과를(이미 처리된 결과 = 실행하고 나온 화면의 결과) 삽입 -->

</body>
</html>