<%@page import="vo.DeptVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%

	
	// request.getAttribute("vo"); = <jsp:useBean id="vo2" class="vo.DeptVO" scope="request"/>

%>

<!-- 
	Object obj = request.getAttribute("vo2");
	if(obj != null){
		DeptVO vo2 = (DeptVO)obj;
	}else{
		DeptVO vo2 = new DeptVO();
 -->

<jsp:useBean id="vo2" class="vo.DeptVO" scope="request"></jsp:useBean>
<div class="container"> 
	<table class="table">
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<tr>
			<td><jsp:getProperty property="deptno" name="vo2"/></td>
			<td><jsp:getProperty property="dname" name="vo2"/></td>
			<td><jsp:getProperty property="loc" name="vo2"/></td>
		</tr>
		
		<tr>
			<td><%= vo2.getDeptno() %></td>
			<td><%= vo2.getDname() %></td>
			<td><%= vo2.getLoc() %></td>
		</tr>
	</table>
</div>
</div>
</body>
</html>