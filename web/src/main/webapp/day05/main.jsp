<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
	<div id = "container">
		<div>
			<img src="../img/naver.png" alt="" />
		</div>
		<div id = "nav">
			<a href="#">뉴스</a>
			<a href="#">enter</a>
			<a href="#">쇼핑</a>
			<a href="#">영화</a>
			<a href="#">요리</a>
			<a href="#">AI</a>
			
		</div>
		<div id = "leftContents">
			<h1>현실이면 좋겠다 .. 뉴스 </h1>
			<ol>
				<li>여름휴가 30일</li>
				<li>동해유전으로 전국민 무상 연금</li>
				<li>월차 15일</li>
				<li>주 3일제 실시</li>
			</ol>
		</div>
		<div id = "sidebar">
			<div id="login">
				<form action="loginOk.jsp">
					<table>
						<tr>
							<td>ID</td>
							<td><input type="text" name="" id="" /></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="text" name="pw" id="" /></td>
						</tr>
						<tr>
							<td colspan = "2">
								<input type="submit" value="로그인" />
								<input type="button" value="회원가입" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div id="footer">
			<span>짝퉁 쇼핑몰</span> 없는 거 배고 다 있음 copyright &copy; <br>
			2013~2024 all rights reserved.
		</div>
	</div>
</body>
</html>