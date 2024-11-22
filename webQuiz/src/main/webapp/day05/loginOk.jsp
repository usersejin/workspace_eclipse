<%@page import="vo.AmazonVO"%>
<%@page import="dao.AmazonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
<%
	
	// db에서 검사 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pw");

	AmazonDAO dao = new AmazonDAO();
	AmazonVO vo = dao.findOneByEmail(id, pwd);

	if (vo == null) {
		out.print("<h3> 회원정보가 없습니다. </h3>");
	
	} else {
	session.setAttribute("vo", vo);
	out.print("<h2>로그인 성공</h2>");
	out.print("<h4>" + vo.getName() + "님 환영합니다.</h4>");
	}
	
	// 회원정보 있으면 login 페이지로 다시 이동
	response.sendRedirect("layout.jsp"); 
	%>
</body>
</html>