<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키</h1>

	<%
	/* 요청객체로부터 쿠키 가져오기 */

	Cookie[] clist = request.getCookies();

	for (Cookie c : clist) {
		out.println("<h2> 쿠키: " + c.getName() + ", " + c.getValue() + "</h2>");
	}
	
	/* c.getName() 이걸 가지고 구분하는 것 */
	
	%>

</body>
</html>