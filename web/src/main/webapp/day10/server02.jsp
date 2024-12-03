<%@page import="java.util.ArrayList"%>
<%@page import="vo.EmpVO"%>
<%@page import="dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmpDAO dao = new EmpDAO();
	ArrayList<EmpVO> list = dao.selectAll();
	
	for (int i = 0; i < list.size(); i++) {
		out.print(list.get(i).getEname());
		if (i < list.size() - 1) {
			out.print(","); 
			// 이름 하나하나를 구분하기 위해 일부러 (,)를 넣은 것!
			// 안하면 뭉떵이로 되므로 enameList에 한 뭉텅이로 들어가게 됨
		}
	}
%>