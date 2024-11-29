<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax02.jsp</title>
<script src="../js/httpRequest.js"></script>
<script>
	function helloToServer() {
		console.log("버튼 눌림");
		let txt = document.querySelector("#txt").value;
		let params = "txt="+txt; // 파라미터값 만들기
		
		// sendRequest(url, 전달 파라미터, 콜백함수명, 통신방식); => 비동기 방식 통신을 생성
		sendRequest("hello.jsp", params, callback, "GET");
		// 통신 객체가 hello.jsp?txt=aaa 요청
	}
	
	
	function callback() {
		// 통신이 완료되고 && 페이지가 정상상태(200)라면
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.dir(xhr);
			document.querySelector("#div1").innerHTML = xhr.responseText;
		}

	}
</script>
</head>
<body>
	
	<!-- hello.jsp?txt=aaa 이런식으로 백그라운드 요청하고 싶다면 -->
	<!-- 동기화 방식은 form태그로 호출 -->
	<!-- 이번엔 비동기화 방식으로 호출하고 싶음 -->
	
	<input type="text" name="txt" id="txt" />
	<input type="button" value="입력" onclick="helloToServer();"/>
	
	<div id="div1">
	</div>

</body>
</html>