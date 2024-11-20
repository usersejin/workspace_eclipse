<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sumValue.jsp</title>
</head>
<body>
	<%
	// 변수 선언 -> java의 주석은 페이지 소스 보기에 나타나지 않음
	for (int i = 1; i <= 100; i++) {
		sum += i;
	}
	%>

	<%-- jsp의 주석은 페이지 소스보기에 나타나지 않음 --%>
	<!-- html 주석은 페이지 소스보기에 나타남 -->
	<h1>
		1부터 100까지 누적합계 :
		<%=sum%>
	</h1>
	<%! 
	// 선언부에 변수 선언 => member 변수로 취급됨
	// jsp 는 내부적으로 servlet으로 변환이 됨
	int sum = 0;%>
	<%-- 선언부에 선언이 되어있다면 꼭 위에 있지 않아도 됨! 
	--%>
</body>
</html>