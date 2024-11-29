<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// idCheckUp.jsp
	
	// 1. 파라미터 값 가져오기 : idCheckUp.jsp를 실행해서 주소창에 idCheckUp.jsp?id=admin 이라고 적을거야
	String id = request.getParameter("id");

	// 2. id가 null이 아니면
	if (id != null){
	
	// 3. MemberDAO
	MemberDAO dao = new MemberDAO();

	// 4. dao.selectOneById(id) => vo 리턴
	MemberVO vo = dao.selectOneById(id);
	
	// 5. vo가 null 이면 존재하지 않는 사원 ==> true 문자를 화면에 출력
		if (vo == null){
			out.println("true");
	
	// 6. vo가 null 아니면 이미 가입된 회원 ==> false 문자를 출력
		}else {
			out.println("false");
		}
	}

%>