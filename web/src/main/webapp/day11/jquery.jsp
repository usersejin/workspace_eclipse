<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(()=>{
	$("#btn").on("click", () => {
		$.ajax({
			url : "dept.xml",
			dataType : "xml",
			success : (data) => {
				console.log(data);
				$(data).find("dept").each(function() {
					let deptno = $(this).find("deptno").text();
					let dname = $(this).find("dname").text();
					let loc = $(this).find("loc").text();
					$("ul").append("<li>" + deptno + " | " + dname + " | " + loc + "</li>");
				})
			}
		});
		
	});
});

</script>
</head>
<body>
	<h3>부서리스트</h3>
	<input type="button" value="부서가져오기" id="btn" />
	<div>
		<ul>
			<li>
				<h2>부서리스트</h2>
			</li>
		</ul>
	</div>
</body>
</html>