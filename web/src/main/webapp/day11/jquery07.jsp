<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	// 1. getMemberJSON.jsp ==> 회원정보를 JSON 형태로 출력
	// 2. 버튼 클릭시 회원 id, pw, name을 ul 태그 자손으로 출력
	$(()=>{
		$("#btn").on("click",function () {
			$.ajax({
				url : "getMemberJSON.jsp"
				success : (data)=>{
					let obj = JSON.parse(data);
					$.each(obj,function (index, member){
						let txt = "<li>" + member.memno + " : " + member.name + " : " + member.id + " : " + member.gender + "</li>";
						$("ul").append(txt);
					});
				}
			});
		});
	});
	

</script>
</head>
<body>
	<h1>AJAX Member JSON</h1>
		<input type="button" value="회원정보 출력" id="btn" />
		<ul>
			<li>회원목록</li>
		</ul>
</body>
</html>