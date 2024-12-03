<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// out.println("ACCOUNTING, SALES, OPERATION, RESEARCH");
	
	/* dao와 vo를 이용해서 같은 효과 내기 */
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptVO> list = dao.selectAll();
	
	for (int i = 0; i < list.size(); i++) {
		out.print(list.get(i).getDname());
		if (i != list.size() - 1) {
			out.print(",");
		}

	}
%>