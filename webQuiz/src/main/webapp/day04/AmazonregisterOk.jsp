<%@page import="vo.AmazonVO"%>
<%@page import="dao.AmazonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AmazonregisterOk.jsp</title>
</head>
<body>

	<h2>회원가입 완료</h2>

	<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");

	if (name != null && pw != null && email != null) {
		AmazonDAO dao = new AmazonDAO();
		AmazonVO vo = new AmazonVO(0, name, email, pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPw(pw);

		dao.insertOne(vo);

		out.println(vo.getEmail());
		out.println(vo.getName());
		out.println(vo.getPw());
	}
	%>



</body>
</html>