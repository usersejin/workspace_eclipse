<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
</head>
<body>

	<!-- jsp + javascript 를 같이 쓰는 경우에는.. 
		실제 동작될 때는 서버에서 java의 문법이 먼저 출력됨
		사용자 브라우저에서는 자바스크립트가 동작됨 
		즉 자바먼저 처리 되고 사용자에게는 자바스크립트로 결과물이 보여짐-->

	<%
	int a = 10;
	%>

	<script type="text/javascript">
		for (let i = 0; i < 5; i++) {
	<%-- <%out.println("hahaha" + a);%> --%>
	<%out.println("console.log('hahaha : '+" + a + ");");%>
		}
	</script>

</body>
</html>