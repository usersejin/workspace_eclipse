<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

	<%
	Object obj = session.getAttribute("vo");
		
		if(obj == null){
			response.sendRedirect("../day07/login.jsp");
		}
		
		BoardDAO dao = new BoardDAO();

		// 페이지네이션
		// 총 게시물 : 
		int totalCount = dao.getTotalCount();
		/* out.println("총 게시물 수 : " + totalCount); */
		// 한 페이지당 게시물 수 : 20
		int recordPerPage = 20;

		// 총 페이지수 301/20 => 15(0으로 나눠떨이지면) 16(0으로 나눠떨이지지 않으면)
		int totalPage = (totalCount % recordPerPage == 0) ? totalCount / recordPerPage : totalCount / recordPerPage;

		// 현재 페이지 번호 (-1은 임의의 값)
		int currentPage = -1;

		// 현재 페이지 번호 가져오기
		String cp = request.getParameter("cp");
		if (cp == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(cp);

		}

		// 페이지조정이 제일 어려움...
		// 1 페이지 시작번호 1 끝번호 20
		// 2 페이지 시작번호 21 끝번호 40
		// 3 페이지 시작번호 41 끝번호 60	

		// 페이지 시작번호
		int startNo = (currentPage - 1) * recordPerPage + 1;

		// 페이지의 끝번호
		int endNo = currentPage * recordPerPage;

		// 시작 페이지 번호
		int startPage = 1;
		// 끝 페이지 번호
		int endPage = totalPage;

		// 시작 페이지 미세조정
		startPage = Math.max(1, currentPage - 4);

		// 끝 페이지 미세조정
		endPage = Math.min(totalPage, startPage + 9);

		/* // 시작 페이지 미세조정
		if (currentPage <= 5) {
			startPage = 1;
		} else if (currentPage >= 6) {
			startPage = currentPage - 4;
		}
		
		// 현재 페이지를 기준으로 앞으로 4개 뒤로 4개
		endPage = currentPage + 4;
		
		// 끝 페이지 미세조정
		if (totalPage - currentPage <= 5){
			endPage = totalPage;
		} else if (totalPage - currentPage > 5){
			if (currentPage <= 5){
		if (totalPage > 10){
			endPage = 10;
		} else {
			endPage = totalPage;
		}
			} else {
		endPage = currentPage + 4;
			}
		} */

		/* 
		out.println("<h5> 총 게시물 수" + totalCount + "</h5>");
		out.println("<h5> 한 페이지당 게시물 건수" + recordPerPage + "</h5>");
		out.println("<h5> 총 페이지 수" + totalPage + "</h5>");
		out.println("<h5> 시작번호" + startNo + "</h5>");
		out.println("<h5> 끝번호" + endNo + "</h5>");
		 */

		ArrayList<BoardVO> list = dao.selectAll(startNo, endNo);
	%>

	<div class="container">
		<table class = "table table-striped">
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
	<%
	for (BoardVO vo : list) {
	%>
	<tr>
		<td><%=vo.getBno()%></td>
		<td><a href="detail.jsp?bno=<%=vo.getBno()%>"><%=vo.getTitle()%></a></td>
		<td><%=vo.getWriter()%></td>
		<td><%=vo.getHits()%></td>
	</tr>
	<%
	}
	%>

			<tr>
				<td colspan="4">
					<a href="write.jsp">
						<input type="button" value="글쓰기" class="btn btn-outline-primary" />
					</a>
				</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<nav aria-label="Page navigation">
					  <ul class="pagination">
					  	<li class="page-item"><a class="page-link" href="list.jsp?cp=<%= currentPage - 1 %>">Previous</a></li>
							<%
							for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) {
							%>
							<!-- 현재 페이지 활성화 -->
							<li class="page-item active" aria-current="page">
							<a class="page-link" href="list.jsp?cp=<%= i%>"><%= i%></a>
							</li>
							<%
							/* 현재 페이지가 아니라면 */
							} else {
							%>
								
							<li class="page-item" aria-current="page">
							<a class="page-link" href="list.jsp?cp=<%= i%>"><%= i%></a>
								
							<% 
							} 
							%>
							<!-- cp = current page -->
							</li>
							<%
							}
							%>
						<li class="page-item"><a class="page-link" href="list.jsp?cp=<%= currentPage + 1 %>">Next</a></li>
					  </ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>