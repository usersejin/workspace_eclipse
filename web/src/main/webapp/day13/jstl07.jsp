<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
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
<h2>jstl.07</h2>
<h3>${param.code1 }</h3>
<h3>${param.code2 }</h3>

<%
	// 자바 문법
	// session에 list 속성
	Object obj =  session.getAttribute("list");
	ArrayList<DeptVO> list = (ArrayList<DeptVO>)obj;
	// 반복문 사용해서
	for( DeptVO vo : list){
		// h3 태그로 부서번호 : 부서명 : 위치 출력
		out.println("<h3>" + vo.getDeptno() + " : " + vo.getDname() + " : " + vo.getLoc() + "</h3>");
	}

%>

<hr/>

<c:forEach var="vo" items="${list}">
	<h3>${vo.deptno} : ${vo.dname } : ${vo.loc }</h3>

</c:forEach>

</body>
</html>