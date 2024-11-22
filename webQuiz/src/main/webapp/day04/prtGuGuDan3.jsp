<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prtGuGuDan2.jsp</title>
</head>
<body>
	<form action="" method = "get">
		<input type="text" name="dan" id="" />
		<input type="submit" value="dan" />
	</form>

	<%
	String d = request.getParameter("dan");
	if (d != null) {
		int dan = Integer.parseInt(d);
		for (int i = 1; i < 10; i++) {
			out.println(dan + " * " + i + " = " + dan * i + "<br>");
		}
	}
	%>
</body>
</html>