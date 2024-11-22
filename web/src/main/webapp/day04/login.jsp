<!-- 로그인 회원가입 id pw 받아서 데이터 연결 -->
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginday04.jsp</title>
</head>
<body>
	<%
	// 로그인이 되어있는지 확인
	Object obj = session.getAttribute("vo");

	if (obj != null) { // 로그인이 되어있는 상태
		MemberVO vo = (MemberVO) obj;
/* 		out.println("<h3><a href = 'logout.jsp'>" + vo.getName() + "</a></h3>");*/		out.println("<h3><a href = 'logout.jsp'>로그아웃</a></h3>");
	} else {
	%>
	<form action="loginOk.jsp" method="get">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" id="pw" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" />
					<a href="register.jsp" method = "get"> 
						<input type="button" value="회원가입" />
					 </a>
				 </td>
			</tr>
		</table>
	</form>

	<%
	}
	%>
</body>
</html>