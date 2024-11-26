<%@page import="javax.swing.text.Document"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productRegOk.jsp</title>
</head>
<body>
	<%
		String pname = request.getParameter("pname");
		String bigpimg = request.getParameter("bigpimg");
		String pimg = request.getParameter("pimg");
		int pqty = Integer.parseInt(request.getParameter("pqty"));
		int price = Integer.parseInt(request.getParameter("price"));
		int pdesc = Integer.parseInt(request.getParameter("pdesc"));
		String pdetail = request.getParameter("pdetail");
	
		ProductDAO dao = new ProductDAO();
		ProductVO vo = new ProductVO(0, pname, price, pqty, pdetail, pdesc, bigpimg, pimg);
		
		if (vo != null){
		dao.insertOne(vo);			
		
		out.println("<h4> 상품등록 완료 </h4>");
		
		} else {
			out.println("<h4> 상품등록 실패 </h4>");
		}
	%>
</body>
</html>