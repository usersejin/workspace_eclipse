<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<!-- 버튼 클릭하면 WriteFormAction ==> views/writeForm.jsp -->
<a href="board.do?cmd=write">
<input type="button" value="글쓰기" class="btn-outlie-primary" /></a>	
	<table class = "table table-striped">
		<tr>
			<th>게시물 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${list}" >
			<tr>	
				<td>${vo.bno}</td>
				<td><a href="board.do?cmd=detail&bno=${vo.bno }">${vo.title}</a></td>
				<td>${vo.writer}</td>
				<td>${vo.hits}</td>
			
			</tr>
		</c:forEach>
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
					  	<li class="page-item"><a class="page-link" href="board.do?cp=${currentPage }">Previous</a></li>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
							
							<li class="page-item" aria-current="page">
							<a class="page-link" href="board.jsp?cp=${i }">${i }</a>
							</li>
							</c:forEach>
							<!-- 현재 페이지 활성화 -->
							<li class="page-item" aria-current="page">
							<a class="page-link" href="board.do?cp=${i }">${i }</a>
								
							
						<li class="page-item"><a class="page-link" href="board.do?cp=${currentPage +1 }">Next</a></li>
					  </ul>
					</nav>
				</td>
			</tr>
	</table>
</div>
</body>
</html>