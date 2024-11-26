<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#container {
	width: 1000px;
	margin: auto;
}

img {
	width: 200px;
	height: 300px;
}

p {
	text-align: center;
}

.wrap {
	width: 200px;
	border: 1px solid gray;
	float: left;
	padding: 20px;
	margin: 2px;
}

.del {
	text-decoration: line-through;
	/* 	color: red; */
}
</style>
</head>
<body>
	<div class="container">

		<%
		ProductDAO dao = new ProductDAO();

		ArrayList<ProductVO> list = dao.selectAll();

		for (ProductVO vo : list) {
/* 			out.println("<h2>" + vo.getPname() + "</h2>"); */		
		
		// 상품의 길이가 너무 길면 (8자까지만 출력)
		// 상품명 구하기
		// 상품명의 길이 구하기
		// 이길이가 8자 이상이면 8자까지만 출력
		if (vo.getPname().length() > 9){
		// 이클립스 콘솔에 출력
			/* System.out.println(vo.getPname().substring(0,8) + "..." + vo.getPname()); */
		}

		// 데이터에 길이가 조절된 이름으로 넣기 
		vo.setPname((vo.getPname().length() > 9)?
				vo.getPname().substring(0,8)+ "..." : vo.getPname());
		
		

		
		%>
		
		<div class="wrap">
			<h2><%= vo.getPname() %></h2>
			<a href="productDetail.jsp?pno=<%= vo.getPno() %>">
			<img src="<%= vo.getImgfile() %>" alt="" /></a>
			<p>대박할인</p>
			<p class="del"><%= vo.getPrice() %></p>
			<p>할인율<%=vo.getDcratio()%></p>
			<p><%=Math.round(vo.getPrice() * (1 - vo.getDcratio() * 0.01))%>원</p>

			<p>
				<input type="button" value="즉시구매" /> <input type="button"
					value="장바구니" />
			</p>

		</div>
		
		
		
		<% 
			
		}
		
		%>
	
	</div>

</body>
</html>