<!-- 부트스트랩 이용하기 1 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bootstrap01.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
div {
	border: 1px solid black;
}
</style>
</head>
<body>

	<div class = "container">
	<!-- 기본 격자 시스템 (12) -->
	
		<div class="row">
			<div class="col">1</div>
			<div class="col">2</div>
			<div class="col">3</div>
		</div>
		
		<!-- 컬럼 4개짜리 row를 추가 1~4 = 공간을 4등분으로 -->
		<div class="row">
			<div class="col">1</div>
			<div class="col">2</div>
			<div class="col">3</div>
			<div class="col">4</div>
		</div>
		
		<!-- 컬럼 5개짜리 row를 추가 5~9 = 공간을 5등분으로 -->
		<div class="row">
			<div class="col">5</div>
			<div class="col">6</div>
			<div class="col">7</div>
			<div class="col">8</div>
			<div class="col">9</div>
		</div>
		
	</div>

</body>
</html>