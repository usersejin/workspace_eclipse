<!-- 부트스트랩 이용하기 2 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bootstrap02.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3>표만들기</h3>
		<table class="table table-hover table-striped">
			<caption>CATALOG</caption>
				<tr>
					<th>NO</th>
					<th>제품명</th>
					<th>가격</th>
				</tr>
				<tr>
					<th>1</th>
					<th>김밥</th>
					<th>4500</th>
				</tr>
				<tr>
					<th>2</th>
					<th>라면</th>
					<th>4000</th>
				</tr>
		</table>
	</div>

	<button type = "button">버튼</button>
	<button type = "button" class = "btn">버튼</button> <!-- 일반 버튼 토글 -->
	<button type = "button" class = "btn btn-primary">버튼</button> <!-- 파란색 -->
	<button type = "button" class = "btn btn-success">버튼</button> <!-- 초록색 -->
	<button type = "button" class = "btn btn-danger">버튼</button> <!-- 빨간색 -->
	<button type = "button" class = "btn btn-warning">버튼</button> <!-- 노란색 -->
	<button type = "button" class = "btn btn-info">버튼</button> <!-- 형광하늘색 -->
	<button type = "button" class = "btn btn-dark">버튼</button> <!-- 검은색 -->
	<button type = "button" class = "btn btn-link">버튼</button> <!-- 하이퍼링크처럼 밑줄 -->
	<button type = "button" class = "btn btn-outline-primary">버튼</button> <!-- 아웃라인만 -->
</body>
</html>