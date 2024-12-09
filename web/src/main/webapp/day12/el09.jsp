<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String [] hobbyList = request.getParameterValues("hobby");

	if (hobbyList != null){
		for(String x : hobbyList){
			out.print("<h2> 당신의 취미는 " + x + "입니다. </h2>");
		}
	}

%>

</body>
</html>