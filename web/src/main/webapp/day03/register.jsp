<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerday03.jsp</title>
<script type="text/javascript">
window.onload = () =>{ // 프로그램 실행되지마자 수행
	
	let btn = document.getElementById("btn1"); // btn 속성에 onclick 속성 대신 이렇게 쓸 수 있음
	
	btn.onclick = () => { // onclick 시 함수 호출
		
		let pwd = document.querySelector("#password"); // CSS 선택자로 가져오기
		
		let value = pwd.value;
		
		const minLength = 8;
		const maxLength = 20;
		/* const hasUpperCase = /정규표현식/.test(검사값); */ 
		const hasUpperCase = /[A-Z]/.test(value);
		const hasLowerCase = /[a-z]/.test(value);
		const hasNumber = /[0-9]/.test(value);
		// 특수문자 넣었는지 확인
		const hasSpecialChar = /[!@#]/.test(value);
		// 적절한 문자길이인지 확인
		const isProperLength = value.length >= minLength && value.length <= maxLength;
		
		// console.log(hasUpperCase) // A 적으면 true 출력됨
		let msg = document.querySelector("#msg");
		msg.style.color = "red";
		if(!isProperLength){
			msg.innerHTML = "비밀번호는 8자 이상 20자 이하로 지정하셔야 합니다.";
		}
		if(!hasUpperCase){
			msg.innerHTML = "비밀번호는 최소 하나의 대문자를 포함해야 합니다.";
		}
		if(!hasLowerCase){
			msg.innerHTML = "비밀번호는 최소 하나의 소문자를 포함해야 합니다.";
		}
		if(!hasSpecialChar){
			msg.innerHTML = "비밀번호는 최소 하나의 특수문자를 포함해야 합니다.";
		}
		if(!hasNumber){
			msg.innerHTML = "비밀번호는 최소 하나의 숫자를 포함해야 합니다.";
		}
		
		// 비밀번호의 모든 조건이 만족하면
		if (isProperLength && hasUpperCase && hasLowerCase && hasSpecialChar && hasNumber){
			// 빈칸으로 만들고
			msg.innerHTML="";
			// 서버로 보내기
			let form = document.querySelector("form");
			form.action = "registerOk.jsp";
			form.method = "get";
			form.submit();
		}
	}
	
}
</script>
<style>
h1 {
	margin-left: 380px;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

h1 {
	margin-top: 20px;
}

form {
	display: inline-block;
	text-align: left;
	margin-top: 20px;
}

table {
	border-spacing: 10px;
	margin: 0 auto;
}

input[type="text"], input[type="password"], select {
	width: 200px;
	padding: 5px;
}

input[type="submit"], input[type="button"], input[type="reset"] {
	margin: 5px;
	padding: 5px 10px;
	font-size: 14px;
	cursor: pointer;
}

#item {
	text-align: right;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>가입 신청서</h1>
	<form action="registerOk.jsp" method="get">
		<table>
			<tr>
				<td id="item">ID</td>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<td id="item">NAME</td>
				<td><input type="text" name="name" id="name" /></td>
			</tr>
			<tr>
				<td id="item">주민등록번호</td>
				<td><input type="text" name="idnumber1" id="idnumber1"
					maxlength="6" /> - <input type="text" name="idnumber2"
					id="idnumber2" maxlength="7" /></td>

			</tr>
			<tr>
				<td id="item">비밀번호</td>
				<td>
					<input type="text" name="password" id="password" required/>
					<span id = "msg"></span>
				</td>
			
			</tr>
			<tr>
				<td id="item">전화번호</td>
				<td><input type="text" name="telnumber1" id="telnumber1"
					maxlength="3" /> - <input type="text" name="telnumber2"
					id="telnumber2" maxlength="4" /> - <input type="text"
					name="telnumber3" id="telnumber3" maxlength="4" /></td>
			</tr>
			<tr>
				<td id="item">주소</td>
				<td><input type="text" name="addrs" id="addrs" /></td>

			</tr>
			<tr>
				<td id="item">EMAIL</td>
				<td><input type="text" name="email" id="email" /> @ <input
					type="text" name="emaildomain" id="emaildomain" /> <select name=""
					id="">
						<option value="직접입력">직접입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanafos.com">hanafos.com</option>
				</select></td>
			</tr>
			<tr>
				<td id="item">성별:</td>
				<td><input type="radio" name="gender" id="" value="남" />남 <input
					type="radio" name="gender" id="" value="여" />여</td>
			</tr>
			<tr>
				<td id="item">취미:</td>
				<td><input type="checkbox" name="hobby" id="" value="음악감상" />음악감상
					<input type="checkbox" name="hobby" id="" value="독서" />독서 <input
					type="checkbox" name="hobby" id="" value="운동" />운동</td>
			</tr>
			<tr style="text-align: center">
				<td colspan="3"><input type="button" id="btn1" value="가입하기" />
					<input type="reset" value="취소하기" /></td>
			</tr>
		</table>
	</form>
</body>
</html>