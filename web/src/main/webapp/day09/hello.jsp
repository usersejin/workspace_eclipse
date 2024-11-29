<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// out.println("뽀로로");
	String id = request.getParameter("txt");
	if (id != null){
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.selectOneById(id);
		if (vo != null)
			out.println("<h2>" + vo.getName() + "</h2>");
		else
			out.println("<h2> 회원정보가 없습니다 </h2>");
	} else {
		out.println("<h2> 회원정보가 없습니다 </h2>");
	}
%>