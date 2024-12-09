<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el03.jsp</title>
</head>
<body>
<form action="">
		<input type="text" name="no1" id="" value="${param.no1 }" /> +
		<input type="text" name="no2" id="" value="${param.no2 }"/>
		<input type="submit" value="=" id="" />
		<input type="text" name="no3" id="" value="${param.no1 + param.no2 }"/>
	</form>

</body>
</html>