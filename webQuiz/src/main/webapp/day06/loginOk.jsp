<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOkday06.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	out.println("<h4> ID : " + id + "</h4>");
	out.println("<h4> PW : " + pw + "</h4>");

	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.findOneByIdAndPw(id, pw);

	out.println("<h4>" + vo + "</h4>");

	// 회원정보가 없을 경우
	if (vo == null) {
		// 다시 입력하는 창을 띄우기 위한 redirect
		response.sendRedirect("login.jsp");
	} else {
		out.println("<h1>" + vo.getName() + "님 환영합니다.");
		// session 내장객체 vo 저장
		session.setAttribute("vo", vo);
		out.println("<a href = 'login.jsp'>로그인 페이지로 이동</a>");
		out.println("<a href = 'index.html'>인덱스로 이동</a>");
	}
	%>


</body>
</html>