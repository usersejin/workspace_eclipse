<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el07.jsp</title>
</head>
<body>
	Object 일 때는 이름만 쓰면 됨
	<h3>id1 : ${id1}</h3> 
	<h3>id2 : ${id2}</h3> 
	 el은 null 대신 그냥 출력을 안함
	<h3>id3 : ${id3}</h3>
	<h3>id4 : ${id4}</h3>
<!--  다른 내장객체에 동일한 속성명으로 값을 담았다면 어떤객체에서 꺼내야할지 혼동될 가능성이 존재함 -->
	<h3>pageScope의 id1 : ${pageScope.id1}</h3> 
	<h3>sessionScope의 id1 : ${sessionScope.id1}</h3> 
	<h3>requestScope id2 : ${requestScope.id2}</h3> 
	<h3>sessionScope id3 : ${sessionScope.id3}</h3>
	<h3>applicationScope id4 : ${applicationScope.id4}</h3>
	
</body>
</html>