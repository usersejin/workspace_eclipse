<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Now.jsp</title>
</head>
<body>
	<!-- 현재 시간 출력 -->
	<% Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("현재시간 yyyy년 MM월 dd일 HH시 mm분 ss초 입니다.");
	String time = sdf.format(d);

	out.println("<h2>" + time +"</h2>");
	
	%>
	
	<%-- <h2>
		<%=time%>
	</h2> --%>

</body>
</html>