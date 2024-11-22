<%@page import="vo.EmpVO"%>
<%@page import="dao.EmpDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>사원번호</td>
			<td>사원명</td>
			<td>급여</td>
			<td>입사일</td>
			<td>부서번호</td>
		</tr>
		<%
		EmpDAO dao = new EmpDAO();

		ArrayList<EmpVO> list = dao.selectAll();

		for (EmpVO vo : list) {
		%>
		<tr>
			<td><%=vo.getEmpno()%></td>
			<td><%=vo.getEname()%></td>
			<td><%=vo.getSal()%></td>
			<td><%=vo.getHiredate()%></td>
			<td><%=vo.getDeptno()%></td>
		</tr>


		<%
		}
		%>





	</table>
</body>
</html>