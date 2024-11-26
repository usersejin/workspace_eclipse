<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address1.jsp</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = () =>{
		let btn = document.querySelector("#btn");
		btn.onclick = openKaKaoPostCode;
		
		}
	
	function openKaKaoPostCode() {
	
		/* new daum.Postcode({oncomplete: function (data) {} }).open(); */
		new daum.Postcode({
			oncomplete: function (data) {
				// console.log("팝업 검색 버튼 누름");
				// console.dir(data); // 클릭하면 Object로 던져줌
				document.querySelector("#post1").value = data.zonecode; // 우편번호 가져오기
				document.querySelector("#addrs1").value = data.roadAddress; // 우편번호 가져오기
				document.querySelector("#addrs2").value = data.jibunAddress; // 우편번호 가져오기
				
			}
		}).open();
		
}

</script>
</head>
<body>
	<h1>다음 우편번호 API 사용하기</h1>
	
	<input type="text" name="id" id="post1" />
	<input type="button" value="우편번호" id ="btn" />
	
	도로명 주소 : <input type="text" name="addrs1" id="addrs1" />
	지번 주소 : <input type="text" name="addrs2" id="addrs2" />

</body>
</html>