<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
	int num1 = 0;
	int num2 = 0;
	int num3 = 0;
	// 1. num1, num2 의 파라미터 값 가져오기
	String n1 = request.getParameter("num1");
	String n2 = request.getParameter("num2");

	// 2. num1, num2 의 값이 null이 아니라면 숫자로 형변환
	if (n1 != null && n2 != null) {
		num1 = Integer.parseInt(n1);
		num2 = Integer.parseInt(n2);
	}

	int hap = num1 + num2;
	%>

	<!-- 6. 이 값을 태그의 value 속성 값으로 지정 -->
	<form action=""> 
		<input type="text" name="num1" id="" value="<%=num1%>" /> + 
		<input type="text" name="num2" id="" value="<%=num2%>" /> 
		<input type="submit" value="=" /> 
		<input type="text" name="num3" id="" value="<%=hap%>" />
	</form>

</body>
</html>