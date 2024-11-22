<%@page import="vo.AmazonVO"%>
<%@page import="dao.AmazonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

AmazonDAO dao = new AmazonDAO();
AmazonVO vo = dao.findOneByEmail(id, pw);

if (vo != null) {
%>
<div id="sidebar">

	<form action="loginOut.jsp">
		<div>
			<br> &nbsp;&nbsp;&nbsp;
			<%=vo.getName()%>님 환영합니다
			</p>
			<br> &nbsp;&nbsp;&nbsp; 
			<input type="submit" value="로그아웃" />
		</div>
	</form>

</div>

<%
}
%>