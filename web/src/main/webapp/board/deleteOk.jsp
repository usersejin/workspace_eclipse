<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteOk.jsp</title>
</head>
<body>
	<%
	String b = request.getParameter("bno");

	if (b != null) {
		int bno = Integer.parseInt(b);

		BoardDAO dao = new BoardDAO();
		dao.deleteOne(bno);
		System.out.println("삭제 성공");
		response.sendRedirect("list.jsp");
		
	%>
	<script>
		alert("삭제 완료");
	</script>
	<%
	
	} else {
		
	%>
	
	<script>
		alert("삭제를 실패했습니다...");
		history.back = 'list.jsp';
	</script>
	<%

		
	}
	%>


</body>
</html>