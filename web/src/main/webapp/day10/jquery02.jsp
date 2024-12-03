<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	let arr = [
		{name : "둘리", age : 20},
		{name : "뽀로로", age : 25},
	];
	
	/* 둘리 : 20
	뽀로로 : 25 출력하기 */
	$(()=>{
		
	$("#btn").on("click", ()=>{
		
		 for (let i = 0 ; i < arr.length ; i++){ // 기본적인 for 문
			console.log(arr[i].name + " : " + arr[i].age);
		}	
		
		console.log("----------------------------------------");
		 
		arr.forEach(function (el, index){ // 자바스크립에서 지원해주는 for 문
			console.log(index + " : " + el.name + " : " + el.age);
		});
		
		console.log("----------------------------------------");
		
		arr.forEach((el, index) => { // 람다식
			console.log(index + " : " + el.name + " : " + el.age);
		});
		
		console.log("----------------------------------------");

		$.each(arr, function(index, el){ // jquery로 한 for 문
			console.log(index + " : " + el.name + " : " + el.age);
		});
		
		console.log("----------------------------------------");

		$(".friendList li").each(arr, function(index, el){ // jquery로 한 for 문
			console.log(item);
		});
	});
	
	});
	


</script>
</head>
<body>
	<ul class="friendlist">
		<li>둘리</li>
		<li>크롱</li>
		<li>루피</li>
	</ul>
	
	<input type="button" value="반복문을 통해 콘솔에 출력 " id="btn"/>

</body>
</html>