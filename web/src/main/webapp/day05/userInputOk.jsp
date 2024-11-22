<!-- JSP 로 쿠키 생성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInputOk.jsp</title>
</head>
<body>
	<%
	// Cookie (like 헨젤과 그레텔의 쿠키 마지막에 뭘 봤는지 그 경로를 확인 가능함)
	// 서버가 사용자 브라우저에 남기는 작은 정보의 조각
	
	// 쿠키와 세션의 차이 ~~ 알기 세션은 브라우저 종료시까지 쿠키는 .. ?

	String txt = request.getParameter("txt");

	out.println("<h2>" + txt + "</h2>");

	// 쿠키 생성
	Cookie c = new Cookie("txt", txt);

	// 이 쿠키의 유통기한 1년
	// c.setMaxAge(60 * 60 * 24 * 365); // 초*분*시*일

	// 이 쿠키의 유통기한 1분
	c.setMaxAge(60 * 1);

	// 사용자 브라우저에 이 내용 저장시킴
	response.addCookie(c);
	%>
	<a href="userCookieList.jsp">쿠키보러가기</a>

</body>
</html>