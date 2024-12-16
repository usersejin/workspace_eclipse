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
	String n = request.getParameter("num");
	if(n!=null){
		Object obj = session.getAttribute("num");
		String key = (String)obj;
		if(key.equals(n)){
			out.println("<h3> 인승 성공 </h3>");
		}else {
			out.println("<h3> 인증 실패 </h3>");
			
			%>
			<form action="authOk.jsp" method="post">
			인증번호 : <input type="text" name="num" id="" /><br>
			<input type="submit" value="본인인증 확인" /></form>
			<% 
		}
	}

%>
</body>
</html>