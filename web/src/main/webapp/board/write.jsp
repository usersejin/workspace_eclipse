<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<script src="../lang/summernote-ko-KR.js"></script>
<style>
textarea {
	resize: none;
}
</style>
</head>
<body>
	<div class="container">
		<form action="writeOk.jsp">
			<table class="table">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" id="" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name = "contents" class="summernote" id="" cols="50" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan = "2">
						<a href="list.jsp"><input type="button" value="목록" class="btn btn-outline-primary" /></a>
						<input type="submit" value="작성" class="btn btn-outline-success" />
						<input type="reset" value="다시쓰기" class="btn btn-outline-danger" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script> 
 $('.summernote').summernote({ 
	  // 에디터 높이 
	  height: 300, 
	  // 에디터 한글 설정 
	  lang: "ko-KR", 
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.) 
	  focus : true, 
	  toolbar: [ 
		    // 글꼴 설정 
		    ['fontname', ['fontname']], 
		    // 글자 크기 설정 
		    ['fontsize', ['fontsize']], 
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기 
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']], 
		    // 글자색 
		    ['color', ['forecolor','color']], 
		    // 표만들기 
		    ['table', ['table']], 
		    // 글머리 기호, 번호매기기, 문단정렬 
		    ['para', ['ul', 'ol', 'paragraph']], 
		    // 줄간격 
		    ['height', ['height']], 
		    // 그림첨부, 링크만들기, 동영상첨부 
		    ['insert',['picture','link','video']], 
		    // 코드보기, 확대해서보기, 도움말 
		    ['view', ['codeview','fullscreen', 'help']] 
		  ], 
		  // 추가한 글꼴 
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'], 
		 // 추가한 폰트사이즈 
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'] 
	}); 
</script>

</body>
</html>