<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptVO> list = dao.selectAll();
	
	// 세션에 부서 목록을 속성으로 저장
	session.setAttribute("list", list);
	
	// jstl07로 리다이렉트
	/* response.sendRedirect("jstl07.jsp"); */

%>
	<!-- c태그로 리다이렉트 하면서 prameter 값 넘길 수 있음 (원래느 안됨) -->
	<c:redirect url="jstl07.jsp">
		<c:param name="code1" value="a001"></c:param>
		<c:param name="code2" value="a002"></c:param>
	</c:redirect>

</body>
</html>