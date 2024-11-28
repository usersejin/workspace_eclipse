<%@page import="lombok.Builder"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeOk.jsp</title>
</head>
<body>
	<%
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
	
		BoardDAO dao = new BoardDAO();
		
		// builder 사용해보기
		BoardVO vo= BoardVO.builder()
					.writer(writer)
					.title(title)
					.contents(contents)
					.ip(request.getRemoteAddr())
					.build();
		
		dao.insertOne(vo);
	
		
		
		response.sendRedirect("list.jsp");
	
	%>
</body>
</html>