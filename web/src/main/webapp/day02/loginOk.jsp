<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");

	/* sysout 이거는 eclipse 콘솔에는 뜨고 사용자 ui 에는 안뜸 */
	/* out 내장 객체로 쓰면 사용자 ui에 뜸 */
	/* id와 pw 출력하는 방법 두가지  */
	out.println("<h2> ID : " + id + ", PW : " + pw + "</h2>");
	%>
	
	<!-- 두번째 방법 -->
	<!-- id 변수가 가지고 있는 값 -->
	<h2>
		id:<%=id%></h2>
	<h2>
		pw:<%=pw%></h2>


</body>
</html>