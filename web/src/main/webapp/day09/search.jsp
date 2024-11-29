<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String txt = request.getParameter("txt");
	if (txt != null){
		ProductDAO dao = new ProductDAO();
		ProductVO vo = dao.findByname(txt);
		
		if (vo == null){
			out.println("https://cdn-icons-png.flaticon.com/512/4553/4553028.png");
		}else{
			out.println(vo.getImgfile());
		}
	}
%>