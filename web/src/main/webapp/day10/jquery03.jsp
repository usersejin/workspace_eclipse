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
		// 1. 버튼을 클릭하면 콘솔에 메세지 출력
		$("input").on("click", function() {
		console.log("버튼 눌림");			
		// 2. server02.jsp 를 작성하고 실행 시 사원이름이 출력 : SCOTT, BLAKE, KING
		// 3. 버튼을 클릭하면 server02.jsp 의 내용을 콘솔에 출력(비동시 통신 $.ajax());
		$.ajax({
			url : "server02.jsp",
			success : function(data){
				// 4. 버튼을 클릭하면 server02.jsp 의 내용을 배열로 만들어서 콘솔에 출력
				let data2 = data.trim();
				// 7. server02.jsp 의 내용을 사원테이블의 사원의 이름을 출력하는 자바코드로 변경 (dao,vo를 사용해서)
				let enameList = data2.split(","); 
				console.log(enameList);
				
				enameList.forEach((x) => {
					// 5. 배열에서 한개씩 꺼내 <li>SCOTT</li> 형태로 완성
					// 6. ul 태그 뒤에 붙임
					$("ul").append("<li>" + x + "</li>");
					
					});
				}
			});
		});
	});
	

</script>
</head>
<body>
	<h2>사원목록</h2>
	<input type="button" value="출력" />
	<div>
		<ul>
			<li>
				<h2>사원</h2>
			</li>
		</ul>
	</div>
</body>
</html>