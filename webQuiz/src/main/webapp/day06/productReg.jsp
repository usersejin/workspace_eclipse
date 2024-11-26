<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productReg.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
.container{
	width : 1000px;
	margin : auto;
	text-align : center;
}
input{
	width : 500px;
}
h3{
	font-weight : bold;
	margin : auto;
	text-align : center;
	margin-top : 30px;
}
.menu{
	margin-left : 300px;

}

</style>
</head>

<body>
	<form action="productRegOk.jsp">
		<div class = "container">
			<h3>상품 등록</h3>
			<br>
			<div class = "row">
				<div class="col">
					상품명
					<br><input type="text" name="pname" id="" />
				</div>	
			</div>
			
			<div class = "row">
				<div class="col">
					상품이미지(큰 ver.)
					<br><input type="text" name="bigpimg" id="" />
				</div>
			</div>
			
			<div class = "row">
				<div class="col">
					상품이미지(작은 ver.)
					<br><input type="text" name="pimg" id="" />
				</div>
			</div>
			
			<div class = "row">
				<div class="col">상품수량
				<br><input type="text" name="pqty" id="" /></div>	
			</div>
			
			<div class = "row">
				<div class="col">판매가
				<br><input type="text" name="price" id="" /></div>	
			</div>
			
			<div class = "row">
				<div class="col">할인율<br><input type="text" name="pdesc" id="" /></div>	
			</div>
			
			<div class = "row">
				<div class="col">상세설명<br><input type="textarea" name="pdetail" id="" /></div>	
			</div>
			
			<br>
			<div class="menu">
				<div class="row">
					<div class="col">
					<button type = "submit" class = "btn btn-primary">등록</button>
					<button type = "button" class = "btn btn-outline-primary">reset</button>
					<button type = "button" class = "btn btn-light">main</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>