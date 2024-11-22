<!-- 자바스크립트로 쿠키 생성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie.jsp</title>
<script type="text/javascript">
	// 자바 스크립트로부터 쿠키 만들기 -> 프론트에서 주로 사용하고 .. 백에서는 jsp로 사용한대
	
	window.onload = () => {
		document.cookie = "name=coffee";
		let date = new Date();
		date.setTime(date.getTime()+1*60*1000)// 60초
		document.cookie="product=monitor;expires=" + date.toUTCString();
		
		let x = document.cookie;
		console.log(x);
	}
</script>
</head>
<body>

</body>
</html>