<%@page import="vo.DeptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actionTag02.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<%
	// 부서 객체를 하나 생성하고 부서정보를 입력
	
/*	
	DeptVO vo = new DeptVO();
	vo.setDeptno(11);
	vo.setDname("IT");
	vo.setLoc("서울");
	
	// 세션에 vo 라는 이름을 vo 객체에 담기
	session.setAttribute("vo", vo);
	
	Object obj = session.getAttribute("vo");
	DeptVO vo2 = (DeptVO)obj;
*/	
	// 부트스트랩을 사용해 표를 만들고
	// 이 내용을 화면에 출력
	
/* 
	위의 내용(세션)과 같은 역할을 하는 태그가 있음 
	vo(value object)를 javaBean, DTO(Data Tranfer Objec), POJO(Plain Old Java Object)이라고 함
	어느 상황 어느 파트냐에 따라 vo, javaBean, DTO 다른이름으로 불림
*/
	// page가 기본값으로 현재 페이지 안에서만 값이 살아있음
	// pageContext.setAttribute("vo", vo); = <jsp:useBean id="vo" class="vo.DeptVO" scope="page"/>
	
	// request
	// request.setAttribute("vo2", vo2); = <jsp:useBean id="vo2" class="vo.DeptVO" scope="request"/>
	
	
%>
<!-- DeptVO vo = new DeptVO(); useBean => 자바빈 객체 생성 / 기존 객체를 가져오는 역할 -->
<!-- scope="객체가 살아있는 범위" -->
<jsp:useBean id="vo2" class="vo.DeptVO" scope="request"></jsp:useBean>

<!-- 
	page => pageContext.setAttribute("vo2", vo2);
	

 -->

<!-- vo.setDeptno(11); setProperty => 생성된 자바빈 객체의 속성(프로퍼티)값을 설정하는 역할 -->
<jsp:setProperty property="deptno" name="vo2" value="11"/>
<jsp:setProperty property="dname" name="vo2" value="IT"/>
<jsp:setProperty property="loc" name="vo2" value="서울"/>



<div class="container">
	<table class="table">
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<tr>
			<td><jsp:getProperty property="deptno" name="vo2"    /></td>
			<td><jsp:getProperty property="dname" name="vo2"/></td>
			<td><jsp:getProperty property="loc" name="vo2"/></td>
			
		</tr>
		<tr>
			<td><%= vo2.getDeptno() %></td>
			<td><%= vo2.getDname() %></td>
			<td><%= vo2.getLoc() %></td>
			
		</tr>
	</table>
 	<jsp:forward page="actionTag03.jsp"></jsp:forward> 
 	
 	<%
 		// sendRedirect는 request로 객체 전달이 안되고 session에 담아서 전달해야해
 		response.sendRedirect("actionTag03.jsp");
 	%>
 
 
 </div>

</body>
</html>