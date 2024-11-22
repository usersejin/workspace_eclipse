<%@page import="vo.AmazonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 
Object obj = session.getAttribute("vo"); // session 에서 vo 속성값 가져오기 
if (obj != null) {
	AmazonVO vo = (AmazonVO) obj;
%>
<div id = "sidebar">
	<div id="login">
		<form action="loginOut.jsp">
		<div>
			<br> &nbsp;&nbsp;&nbsp;
			<%=vo.getName()%>님 환영합니다
			
			<br> &nbsp;&nbsp;&nbsp; 
			<input type="submit" value="로그아웃" />
		</div>
	</form>
	</div>
	</div>
		<%
} else {
%>
	<div id = "sidebar">
		<div id="login">
			<form action="loginOk.jsp">
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" id="" /></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="text" name="pw" id="" /></td>
					</tr>
					<tr>
						<td colspan = "2">
							<input type="submit" value="로그인" />
							<input type="button" value="회원가입" />
						</td>
					</tr>
				</table>
			</form>
	
	</div>
</div>
<%
	}
	%>