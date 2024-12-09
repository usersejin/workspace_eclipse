<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>json.jsp</title>
<script>
/* 	{
		"name" : "hong",
		"age" : "20",
		"address" : "seoul"
	} */
 
	let obj = new Object();
	obj.name = "hong";
	obj.age = 20;
	obj.address = "seoul";
	console.dir(obj);
	
	// JSON.stringfy(): javascript 객체나 배열을 JSON 형식의 문자열로 변환하는데 사용
	let jsonData = JSON.stringfy(obj);
	console.log(jsonData);
	
	let p1 = JSON.parse(jsonData);
	console.log(p1);
	console.log(p1.name);
 
</script>
</head>
<body>

</body>
</html>