<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery04.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(() => {
		$("#btn").on("click", ()=>{
			console.log("버튼눌림");
			$.ajax({
				url : "server04.xml",
				dataType : "xml",
				success : (data) =>{
					console.log(data);
					// 넘겨받은 데이터에서 book이라는 요소를 검색하려면..
					console.log($(data).find("book"));
					$(data).find("book").each(function() {
						// 각각의 요소마다 타이틀 엘리미너트 객체에 접근하려면..
						let title = $(this).find("title").text();
						let price = $(this).find("price").text();
						console.log(title + " : " + price);
						$("ul").append("<li>" + title + " : " + price + "</li>");
					})
				}
			});
		});
	});

</script>
</head>
<body>
	<h3>도서관</h3>
	<input type="button" value="도서목록" id="btn"/>
	<div>
		<ul>
			<li>
				<h2>신간목록</h2>
			</li>
		</ul>
	</div>

</body>
</html>