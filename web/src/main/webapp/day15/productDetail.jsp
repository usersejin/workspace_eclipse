<%@page import="java.util.Calendar"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>사진 상세보기</title>
<style>
	.container {
		margin-top: 50px;
	}
	.table {
		text-align: left;
	}
	
	.font-bold {
		font-weight: bold;
	}
	
	.color-red {
		color: red !important;
	}
	
	.margin-bottom-5 {
		margin-bottom: 5px;
	}
	
	.font-size-10 {
		font-size: 10pt;
	}
	
	img {
		width: 500px;
	}
	
	a {
		text-decoration: none;
	}
	
</style>
<script>
	$(function(){
		$("#cart").on("click", function(){
			// 2초 후 장바구니로 폼 제출
			window.setTimeout(() => {
				const form = document.forms['frm'];
				form.action = "cart.jsp";
				form.method = "get";
				form.submit();
			}, 10);
		});
	});
</script>

</head>
<body>
	<%
		String p = request.getParameter("pno");
		
		if(p != null) {
			int pno = Integer.parseInt(p);
			ProductDAO dao = new ProductDAO();
			ProductVO vo = dao.selectOne(pno);
			
			int price = vo.getPrice();
			String priceT = String.format("%,d", price);
			String priceT2 = String.format("%,d",  Math.round(vo.getPrice()*(1-vo.getDcratio()*0.01)) );
			// String.format("%,d", (int)(vo.getPrice()*(1-vo.getDcratio()*0.01)) );
			
			
			// 현재 날짜시간 구하기
	        Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.DATE, 3); // 3일 후
	        
			int month = cal.get(Calendar.MONTH) +1; 
			int day = cal.get(Calendar.DAY_OF_MONTH); 
			
			int dayOfWeekNumber = cal.get(Calendar.DAY_OF_WEEK); // 1은 월요일, 7은 일요일
			String week = "";
			switch(dayOfWeekNumber) {
				case 1: 
					week="월";
					break;
				case 2: 
					week="화";
					break;
				case 3: 
					week="수";
					break;
				case 4: 
					week="목";
					break;
				case 5: 
					week="금";
					break;
				case 6: 
					week="토";
					break;
				case 7: 
					week="일";
					break;
			}
	        
	%>
		<div class="container">
			<form action="" name="frm">
			<input type="hidden" name="pno" id='pno' value="<%= vo.getPno() %>" />
		
			<div class="row text-center">
				<div class="col-sm-6">
					<p class="">
						<img src="<%= vo.getImgfile() %>" alt="<%= vo.getProdesc() %>" />
					</p>
					
				</div>
				
				<div class="col-sm-6">
					<table class="table">
						<tr>
							<th>
								<h4><%= vo.getPname()+"...,"+vo.getQty()+"개" %></h4>
								5.0 ⭐⭐⭐⭐⭐ 1개 상품평
							</th>
						</tr>
						<tr>
							<td>
								<p><%= vo.getDcratio() %>%
									<del><%= priceT %>원</del>
								</p>
								<h4 class="font-bold color-red"><%= priceT2 %>원 <span class="font-size-10">즉시 할인가</span></h4>
							</td>
						</tr>
						
						<tr>
							<td>
								<p class="font-size-10">배송비 5,000원</p>
								<p class="font-size-10">같은 판매자 상품 30,000원 이상 구매시 무료배송</p>
								<p class="color-red font-size-10" style="margin-bottom: 5px;">
									<%= (vo.getQty() < 5) ? 
											("품절임박 ("+vo.getQty()+"개남음)") : "("+vo.getQty()+"개남음)"
									%>
								</p>
							</td>
						</tr>
						
						<tr>
							<td>
								<p class="font-size-10">글피(<%= week %>) <%= month %>/<%= day %> 도착 예정</p>
								<p class="font-size-10">배송사: CJ 대한통운</p>
								<p>
									<span class="col col-6">
										<input type="number" name="cnt" id="" value="1" style="height: 34px;" />
									</span>
									<span class="col col-6">
										<input type="button" id="cart" class="btn btn-outline-primary margin-bottom-5" value="장바구니 담기" />
										<input type="button" id="now" class="btn btn-primary margin-bottom-5" value="바로 구매 > " />
										<a href="productList.jsp" id="list" class="btn btn-outline-success margin-bottom-5" >상품목록</a>
										<a href="viewCart.jsp" id="viewCart" class="btn btn-outline-warning margin-bottom-5" >장바구니</a>
									</span>
								</p>
							</td>
						</tr>
						
						<tr>
							<td>
								<ul class="font-size-10">
									<li>
										색상: 화이트
									</li>
									<li>
										<%= vo.getProdesc() %>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
		</div>
	<% 
		}
	%>
</body>
</html>

