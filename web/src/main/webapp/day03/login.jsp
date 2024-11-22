<!-- 로그인 회원가입 id pw 받아서 데이터 연결 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginday03.jsp</title>
</head>
<body>
	<form action="loginOk.jsp" method="get">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" id="pw" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" />
					<a href="register.jsp" method = "get"> 
						<input type="button" value="회원가입" />
					 </a>
				 </td>
			</tr>
		</table>
	</form>
</body>
</html>