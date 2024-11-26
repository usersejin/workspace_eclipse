<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewCart.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
img{
		width : 100px;
		height : 10f0px;
	}
	
</style>
</head>
<body>
	<div class="container">
	<table class="table table-striped">
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>이미지</td>
			<td>수량</td>
			<td>가격</td>
			<td>할인가격</td>
		</tr>
	<%
		// session에서 cart 속성 가져오기
		Object obj = session.getAttribute("cart");
		if(obj == null){
		ArrayList<Integer> cart = new ArrayList<>();
			session.setAttribute("cart", cart);
			obj = session.getAttribute("cart");
		}
	
		// ArrayList 1개씩 꺼내서 표형태로 출력
		ArrayList<Integer> cart = (ArrayList<Integer>)obj;
		
		ProductDAO dao = new ProductDAO();
		
		for (int no : cart){
			ProductVO vo = dao.selectOne(no);
		
			
	%>
		<tr>
			<td><%= vo.getPno()  %></td>
			<td><%= vo.getPname()  %></td>
			<td><img src="<%= vo.getImgfile()  %>" alt="" /></in></td>
			<td><%= vo.getQty()  %></td>
			<td><%= vo.getPrice() %></td>
			<td><%= Math.round(vo.getPrice() * (1-vo.getDcratio()*0.01))%>원</td>
		</tr>
	<%
		}
		// 컬럼 상품번호 상품명 이미지(작은크기) 수량 가격 할인가격
	%>
	</table>
	</div>
</body>
</html>