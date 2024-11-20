<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie.jsp</title>
</head>
<style>
img {
	width: 200px;
	height: 250px;
}
</style>
<body>
	<!-- 영화 포스터 5장 출력 -->
	<h3>Test</h3>
	<%
	for (int i = 1; i <= 5; i++) {
	%>

	<!-- 해당 변수 출력 -->
	<h3>
		<%
		out.println(i);
		%>
	</h3>
	<!-- 같은 결과 값 -->
	<h3>
		<%=i%>
	</h3>
	<img src="../img/movie_img<%=i%>.jpeg" alt="" />
	<%
	}
	%>

</body>
</html>