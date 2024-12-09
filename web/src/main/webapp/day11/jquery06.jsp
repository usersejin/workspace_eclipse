<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery06.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	// 클릭하면 getDeptJSON.jsp 의 결과를 가져와서 콘솔에 출력
	$(()=>{
		$("#btn").on("click", ()=>{
			$.ajax({
				url : "getDeptJSON.jsp",
				success : (data)=>{
					console.log(data);
					// JSON 형식의 텍스트를 자바스크립트 객체로 해석
					let obj = JSON.parse(data);
					console.log(obj);
					$.each(obj, function (index, dept){ // .each 가 일종의 for문 형태로 만들어 놓은 것
						console.log(dept.deptno);
						let txt = "<li>" + dept.deptno + " : " + dept.dname + " : " + dept.loc + "</li>";
						$("ul").append(txt);
					})
				}
				
			});
		});
		
	});
</script>
</head>
<body>
	<h3></h3>
	<input type="button" value="부서가져오기" id="btn">
		<div>
			<ul>
				<li>
					<h2>부서리스트</h2>
				</li>
			</ul>
		</div></input>
</body>
</html>