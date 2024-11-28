<%@page import="vo.FileVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "container">
		<table class = "table table-striped">
			<tr>
				<th>파일번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>내용</th>
				<th>첨부파일이미지</th>
				<th>download</th>
			</tr>
			<!-- 반복 -->
			<%
			FileDAO dao = new FileDAO();
			ArrayList<FileVO> list = dao.selectAll();
			for (FileVO vo : list) {
			%>
			<tr>
				<td><%=vo.getNo()%></td>
				<td><%=vo.getTitle()%></td>
				<td><%=vo.getWriter()%></td>
				<td><%=vo.getContents()%></td>
				<td><img src="../upload/<%=vo.getFilename()%>" alt="" /></td>
				<td><a href="../download.do?no=<%= vo.getNo() %>"><%= vo.getFilename() %></a></td>
			</tr>
	
			<%
			}
			%>
		</table>
	</div>
	<a href="dirView.jsp">저장 디렉토리의 파일 목록 보기</a>
</body>
</html>