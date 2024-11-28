<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 1. 파라미터 값 가져오기
	String b = request.getParameter("bno");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	// 2. 이 값이 null이면 list.jsp 로 리다이렉트
	if (b == null){
		response.sendRedirect("list.jsp");
	} else {
		int bno = Integer.parseInt(b);
		// 3. dao
		BoardDAO dao = new BoardDAO();
		BoardVO vo = BoardVO.builder()
				.bno(bno)
				.writer(writer)
				.title(title)
				.contents(contents)
				.build(); 
		
		// 4. dao.updateOne(vo); 을 사용해서 수정
		dao.updateOne(vo);
		
		// 5. 성공하면 list.jsp 리다이렉트
		response.sendRedirect("list.jsp");
		
	}


%>