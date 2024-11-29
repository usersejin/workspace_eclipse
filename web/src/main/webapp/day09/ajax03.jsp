<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax03.jsp</title>
<script src="../js/httpRequest.js"></script>
<script>


	function helloToServer() {
		let txt = document.querySelector("#txt").value;
		let params = "txt="+txt;

		sendRequest("search.jsp", params, callback, "GET");

	}
	
	function callback() {
		// 통신이 완료되고 && 페이지가 정상상태(200)라면
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			let img = document.querySelector("#img");
			img.src = xhr.responseText;
		}

	}
</script>



</head>
<body>
	<input type="text" name="txt" id="txt" />
	<input type="button" value="출력" onclick="helloToServer();" />
	<div class="myconsole">
			<img src="../img/before.png" alt="뽀로로" id = "img"/>
	</div>
</body>
</html>