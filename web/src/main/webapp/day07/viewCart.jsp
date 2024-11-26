<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
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
			<td>개당 가격</td>
			<td>할인율</td>
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
		
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		
		
		ProductDAO dao = new ProductDAO();
		// 12, 12, ... -> 중복된 상품 1,1,1 가 아니라 총 수량 3개로 만들기 (hashmap부터)
		for (int no : cart){
			// n번 상품이 존재하면
			if(map.containsKey(no)){
				// 현재 상품의 개수 구하기
				int cnt = map.get(no);
				// 상품 개수를 1증가
				cnt++;
				// 다시 맵에 넣기
				map.put(no, cnt);		
			}else{
				map.put(no, 1);
			}
			
			System.out.println("map : " + map);
		}
			// map 에서 상품번호만 set 타입으로 리턴
			Set<Integer> key = map.keySet();
			// 반복해서 꺼내기 위해 이터레이터 객체로 가져오기
			Iterator<Integer> it = key.iterator();
			int sum = 0; // 누적값 담는 변수
			while (it.hasNext()){
				// 다음 값이 존재하면
				int item = it.next();
				ProductVO vo = dao.selectOne(item);
				sum += Math.round(vo.getPrice() * (1-vo.getDcratio()*0.01)) * (int)(map.get(item));
				
	%>
	
		<!-- 상품번호 상품명 이미지(작은크기) 수량 가격 할인가격 -->
		<tr>
			<td><%= vo.getPno()  %></td>
			<td><%= vo.getPname()  %></td>
			<td><img src="<%= vo.getImgfile()  %>" alt="" /></in></td>
			<td><%= map.get(item)  %></td>
			<td><%= String.format("%,d", vo.getPrice()) %></td>
			<td><%= vo.getDcratio() %></td>
			<td><%= String.format("%,d", Math.round(vo.getPrice() * (1-vo.getDcratio()*0.01)) * (int)(map.get(item))) %>원</td>
		</tr>
		
	<%
					}
	%>
	
	<tr>
		<td colspan= "5" >합계</td>
		<td><%= String.format("%,d", sum) %></td>
		
	</tr>
	
	</table>
	</div>
</body>
</html>