<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax.jsp</title>
<script>


	let xhr = null;

	// ie
	function getXmlHttpRequest() {
		// MicroSoft 브라우저에서는 .. 
		if (window.ActiveObject) {
			try {
				new ActiveObject("MsMXL2.XMLHttp");
			} catch (e) {
				try {
					return new ActiveObject("Microsoft.XMLHttp");
				} catch (e) {
					null;
				}
			}
		} else if (window.XMLHttpRequest) {
			// 그 외 브라우저라면 (Edge, Chrome 등..)
			return new XMLHttpRequest();
		} else {
			// 그 외외 브라우저라면 ..
			return null;
		}
	}

	function load(url) {
		console.log(url + " 버튼 눌림");
		// 1. 통신객체(XMLHttpRequest) 객체 얻어오기
		xhr = getXmlHttpRequest();

		console.log(xhr);

		console.log("비동기방식으로 접근할 자원의 주소 : " + url);
		// 2. callback 함수
		// 대기하고 있다가 응답이 오면 이 함수를 실행
		xhr.onreadystatechange = viewMessage;
		// 상태가 4번 변경 (4인 상태가 완료된 상태) 

		// 3. open(통신방식, 주소, 비동기통신 여부)
		xhr.open("GET", url, true); // true는 비동기, false는 동기

		xhr.send(null); // get 방식은 따로 줄 게 없어서 null 하면 돼
		// post 방식은 value 값을 줌
	}

	function viewMessage() {
		// console.log("콜백 함수 호출 중");
		// 통신이 완료되고 정상페이지(xhr.status == 200 / 404는 페이지 찾을 수 없는 것)일때만 작업 수행
		if (xhr.readyState == 4 && xhr.status == 200){
			alert(xhr.responseText);
			
			let div1 = document.querySelector("#div1");
			div1.innerText = xhr.responseText;
			
		}

	}
</script>
</head>
<body>
	<input type="button" value="simple1.txt" onclick="load('simple1.txt');" />
	<input type="button" value="simple1.jsp" onclick="load('simple1.jsp');" />
	<input type="button" value="simple2.txt" onclick="load('simple2.txt');" />
	<input type="button" value="simple2.jsp" onclick="load('simple2.jsp');" />
	
	<div id="div1">
	
	
	
	</div>
</body>
</html>