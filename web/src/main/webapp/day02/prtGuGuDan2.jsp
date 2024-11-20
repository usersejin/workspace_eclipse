<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prtGuGuDan2.jsp</title>
</head>
<body>
	<%
	String d = request.getParameter("dan");
	if (d != null) {
		int dan = Integer.parseInt(d);
		for (int i = 1; i < 10; i++) {
			/* println은 개행되는게 맞지만 html 상으로는 보이지 않음 -> 페이지 소스 보기에는 떠
			따라서 html 상으로 표시해주려면 html 태그를 사용해야 함 */
			out.println(dan + " x " + i + " = " + dan * i + "<br>");
		}

	}
	%>
</body>
</html>