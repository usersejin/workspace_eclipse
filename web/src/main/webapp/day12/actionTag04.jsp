<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag04.jsp</title>
</head>
<body>
	<h3>actionTag04.jsp</h3>
	
	
	<!-- actionTag05.jsp?n1=500 과 같은 효과 -->
	
	<jsp:forward page="actionTag05.jsp">
		<!-- param 액션 태그 : parameter 값을 줄 수 있음 -->
		<jsp:param value="500" name="n1"/>
	</jsp:forward>

</body>
</html>