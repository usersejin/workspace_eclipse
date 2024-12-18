<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product.jsp</title>
</head>
<body>

	<a href="productList.jsp">상품목록 링크</a>
	<%
		Object obj = session.getAttribute("vo");
		MemberVO vo = (MemberVO)obj;
		if(vo.getId().equals("admin")){ // admin 사용자만 상품등록링크 볼 수 있게 함
	
	%>
	<a href="productReg.jsp">상품등록 링크</a>
	
	<%
	}
	%>
	<a href="login.jsp">로그인</a>

</body>
</html>