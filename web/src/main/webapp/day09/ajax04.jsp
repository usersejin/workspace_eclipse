<!-- ajax03을 jquery로././. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax04.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$( () => {
	$("img").on("click", function(){
		$("img").attr("src", "../img/after.png");
	
		//jQeury로 비동기 방식 (JSON 타입으로 설정함)
		$.ajax({
			type : "GET", // GET, POST 방식 설정
			async : true, // 비동기화 true, 동기화 false
			url : "getJSON.jsp", // 찾아갈 url
			dataType : "html", // 전송받을 데이터 html, xml
			data : {"id" : "aaa"}, // id=aaa라고 설정한 것임 파라미터값을 설정
			beforeSend : function() {
				console.log("요청보내기전에 호출 됨");
				$("img").fadeIn(2000);
			},
			success : function(response, status, request) {// 성공했다면
				console.log("성공시 메세지 출력")
				console.log(response);
				$("img").attr("src",response);
			},
			complete : function () {
				console.log("AJAX 통신 끝");
				$("img").fadeOut(2000);
			}
		});
	})
});
</script>
</head>
<body>
	<img src="../img/before.png" alt="뽀로로" id="img"/>
</body>
</html>