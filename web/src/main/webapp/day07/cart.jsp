<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String p = request.getParameter("pno");

	// 수량 증가하기 (수량 선택후 장바구니 담기)
	String cnt = request.getParameter("cnt");
	int counter = 0;
	if (cnt == null){
		counter = 1;
	}else {
		counter = Integer.parseInt(cnt);
	}

	// 현재 세션에서 cart라는 이름의 속성 객체를 얻어오기
	
	// session.setAttribute("속성명", "값");
	// session.getAttribute("속성명");
	
	Object obj = session.getAttribute("cart");
	
	// 만약 cart라는 속성이 없다면 하나 만들어줌
	if (obj == null) {
		// ArrayList 생성
		ArrayList<Integer> cart = new ArrayList<>();
		// 세션에 이 속성으로 지정
		session.setAttribute("cart", cart);
		obj = session.getAttribute("cart");
	}

	// obj가 존재한다면
	ArrayList<Integer> cart = (ArrayList<Integer>) obj; // 형변환

	// http://localhost:8080/web/day07/productDetail.jsp?pno=12
	if (p != null) {
		int pno = Integer.parseInt(p);
		for (int i =0; i<counter; i++){
			cart.add(pno);
		}
		cart.add(pno);
		System.out.println("cart : " + cart);

		/* 잘 전달되었는지 상품명을 화면에 출력 
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.selectOne(pno);
		out.println("<h2> 상품명 :  " + vo.getPname() + "</h2>"); */
		response.sendRedirect("productDetail.jsp?pno=" + pno);
	} else {
		// p가 null 이면 상품목록으로 돌아가
		response.sendRedirect("productList.jsp");

	}
%>