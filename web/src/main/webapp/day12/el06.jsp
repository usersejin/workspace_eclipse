<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el06.jsp</title>
</head>
<body>

<%
	Object obj1 = pageContext.getAttribute("id1");
	Object obj2 = request.getAttribute("id2");
	Object obj3 = session.getAttribute("id3");
	Object obj4 = application.getAttribute("id4");
	
	if (obj1 != null && obj2 != null && obj3 != null && obj4 != null){
	
%>
	<h3>id1 : <%= obj1 %></h3>
	<h3>id2 : <%= obj2 %></h3>
	<h3>id3 : <%= obj3 %></h3>
	<h3>id4 : <%= obj4 %></h3>
<%
	}
%>
</body>
</html>