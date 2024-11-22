<!-- 어제 한 dbtest 와 비교하기 -->
<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbtestday03.jsp</title>
</head>
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	width: 400px;
	text-align: center;
}
</style>

<body>
	<%
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptVO> list = dao.selectAll();
	%>
	<table>
		<tr>
			<td>부서번호</td>
			<td>부서명</td>
			<td>위치</td>
		</tr>
		<%
		for (DeptVO vo : list) {
		%>
		<tr>
			<td><%= vo.getDeptno() %></td>
			<td><%= vo.getDname() %></td>
			<td><%= vo.getLoc() %></td>
		</tr>

		<%
		}
		dao.close();
		%>
	</table>

</body>
</html>