<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
page2.jsp 입니다.

<%
// 내장객체 담기 속성 값 꺼내기(getAttribute())
	Object obj1 = pageContext.getAttribute("id1"); 
	out.println("<h2> id1 : " + obj1 + " </h2>"); // 출력 aaa
	// Object 클래스에 있는 toString아니고 String에 있는 toString 을 가져온 것
	
	Object obj2 = request.getAttribute("id2"); 
	String id2 = (String)obj2;
	out.println("<h2> id2 : " + id2 + " </h2>") ; // 출력 bbb
	// 이 과정을 거친 것이 위에 있는 것
	
	Object obj3 = session.getAttribute("id3");
	out.println("<h2> id3 : " + obj3 + " </h2>"); // ccc
	
	Object obj4 = application.getAttribute("id4");
	out.println("<h2> id4 : " + obj4 + " </h2>"); // ddd
	
	%>

</body>
</html>