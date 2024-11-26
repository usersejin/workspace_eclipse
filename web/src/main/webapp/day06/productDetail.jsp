<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
img {
	width: 300px;
	height: 400px;
}

button {
	width: 150px;
}

select {
	width: 50px;
}

.del {
	text-decoration: line-through;
}

.price {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>

	<%
	String p = request.getParameter("pno");

	if (p != null) {
		int pno = Integer.parseInt(p);
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.selectOne(pno);
		
	%> 
		 
	<div class = container>
		<div class = row>
			<div class="col"><img src="<%= vo.getBigfile() %>" alt="" /></div>
			<div class="col"><h2> 상품명 : <%= vo.getPname() %></h2>
			<br><h4><%= vo.getProdesc() %></h4>
			<br><h6 class = "del"><%= vo.getPrice() %>원</h6>
			<br>배송비 3,000원
			<br>같은 판매자 상품 30,000원 이상 구매 시 무료배송
			<br><h5 class = "price"><%= Math.round(vo.getPrice()*(1- vo.getDcratio() * 0.01))%>원</h5>
			<br>
			<p>
			구매 수량 : <select name="qty" id="">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> 
			</p>
			<button type = "button" class = "btn btn-outline-primary">장바구니 담기</button>
			<button type = "button" class = "btn btn-primary">바로구매 ></button>
			
		</div>
	</div>
		
		 
	<%	
	}
	%>

	


</body>
</html>