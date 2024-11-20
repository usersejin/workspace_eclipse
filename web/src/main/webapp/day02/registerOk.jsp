<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerOk.jsp</title>
</head>
<body>
	<h1>회원정보 조회</h1>
	<table>
		<tr>
			<td>ID</td>
			<td><%=request.getParameter("id")%></td>
		</tr>

		<tr>
			<td>NAME</td>
			<td><%=request.getParameter("name")%></td>
		</tr>

		<tr>
			<td>주민등록번호</td>
			<td><%=request.getParameter("idnumber1")%> - <%=request.getParameter("idnumber2")%></td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><%=request.getParameter("telnumber1")%> - <%=request.getParameter("telnumber2")%>
				- <%=request.getParameter("telnumber3")%></td>
		</tr>

		<tr>
			<td>주소</td>
			<td><%=request.getParameter("addrs")%></td>
		</tr>

		<tr>
			<td>이메일</td>
			<td><%=request.getParameter("email")%> @ <%=request.getParameter("emaildomain")%></td>
		</tr>

		<tr>
			<td>성별</td>
			<td><%=request.getParameter("gender")%></td>
		</tr>

		<tr>
			<td>취미</td>
			<%
			String[] hobbyList = request.getParameterValues("hobby");
			for (int i = 0; i < hobbyList.length; i++) {
				/* System.out.println(i); */
			%>
			<td><%=hobbyList[i]%></td>
			<%
			}
			%>
		</tr>
	</table>

</body>
</html>