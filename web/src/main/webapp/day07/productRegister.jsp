<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productRegister.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<form action="productRegOk.jsp">
			<h3>상품등록</h3>
		
			<div class="mb-3">
				<label for="exampleFormControlInput1" class = "form-label">상품명</label>
				<input type="text" class = "form-control" name="" id="exampleFormControlInput1" 
				placeholder = "상품명" />
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlInput2" class = "form-label">이미지</label>
				<input type="text" class = "form-control" name="" id="exampleFormControlInput2" 
				placeholder = "이미지" />
			</div>
		
			<div class="mb-3">
				<label for="exampleFormControlInput3" class = "form-label">수량</label>
				<input type="text" class = "form-control" name="" id="exampleFormControlInput3" 
				placeholder = "수량" />
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlInput4" class = "form-label">판매가</label>
				<input type="text" class = "form-control" name="" id="exampleFormControlInput4" 
				placeholder = "판매가" />
			</div>
		
			<div class="mb-3">
				<label for="exampleFormControlInput5" class = "form-label">할인율</label>
				<input type="text" class = "form-control" name="" id="exampleFormControlInput5" 
				placeholder = "할인율" />
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class = "form-label">상세설명</label>
				<textarea name="" id="exampleFormControlTextarea1" rows="3" class="form-control"></textarea>
			</div>
			
			<button type = "submit" class = "btn btn-primary">등록</button>
			<button type = "button" class = "btn btn-outline-primary">reset</button>
			<a href="product.jsp">main</a>
		</form>
	</div>
</body>
</html>