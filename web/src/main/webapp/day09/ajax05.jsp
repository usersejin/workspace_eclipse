<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax05.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(() => {
		// 이미지 키워드 넣고 출력버튼 누르면
		$("#btn").on("click", function () {
			let value = $("#txt").val();
			
			$.ajax({
				type : "GET",
				async : true,
				url : "search.jsp",
				dataType : "html",
				data : {"txt" : value},
				success : (response, status, request) => {
					console.log("성공시 메세지 출력");
					$("img").attr("src", "../img/after.png");
				}
				
				
			});
		})
			
		
	});
	// img src 속성을 변경

</script>
</head>
<body>
	<input type="text" name="txt" id="txt" />
	<input type="button" value="출력" id="btn" />
	<div class="myconsole">
		<img src="../img/before.png" id="img" alt="" />
	</div>
</body>
</html>