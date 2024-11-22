<!-- jquery 로 cookie 만들기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie2.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie-1.4.1.min.js"></script>
<script type="text/javascript">
	$(() => {
		console.log("JQuery plugin test중");
		
		// 쿠키 생성 : 세션이 종료될 때까지 존재
		$.cookie("id", "hong");
		
		// 7일 뒤에 만료되는 쿠키 생성 (JSON 타입으로 expires )
		$.cookie("keyword", "coffee", {expires:7});
		
		// 쿠키 읽기
		console.log("id : " + $.cookie("id"));
		console.log("keyword : " + $.cookie("keyword"));
		// 모든 쿠키 읽기 -> JSON형식으로 볼 수 있음(출력됨)
		console.log($.cookie());
		
		// 쿠키 삭제 : true, false 리턴
		console.log("keyword 쿠키 삭제 : " + $.removeCookie("keyword"));
 	});
	</script>
</head>
<body>

</body>
</html>