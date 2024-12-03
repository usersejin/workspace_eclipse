<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(() => {
	$("#btn").on("click", () => {
		/* $("ul").append("<li>hahaha</li>"); */
		$.ajax({
			url : "server01.jsp",
			success : function(data){
				console.log(data.trim()); // 공백제거
				let data2 = data.trim();
				let deptList = data2.split(","); //deptList는 배열
				
				deptList.forEach((x) => {
					$("ul").append("<li>" + x + "</li>")
				})
				
				
				
				/* for (let x : deptList){
					$("ul").append("<li>" + x + "</li>");
				} 자바스크립트에서는 향상된 for문 사용 불가*/ 
				
				/* for(let i = 0 ; i <deptList.length ; i++){
					let m = deptList[i];
					let txt = "<li>" + m + "</li>";
					$("ul").append(txt);
				} */
			}
		});
	});
});

</script>
</head>
<body>
	<h2>부서목록</h2>
	<input type="button" value="출력" id="btn"/>
	<div>
		<ul>
			<li>
				<h2>부서</h2>
			</li>
			<!-- <li>SALES</li>
			<li>OPERATION</li> .. 위의 버튼 누르면 부서명이 출력될 수 있도록 -->
		</ul>
	</div>
</body>
</html>