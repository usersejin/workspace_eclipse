<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page1.jsp</title>
</head>
<body>
<h2>page1.jsp 입니다.</h2>
	<%
	// _jspService() 의 지역변수 : 내장 객체
	// 4개의 객체 모두 속성을 새로 담고 꺼내올 수 있음
	// PageContext pageContext : 현재 JSP 페이지에 관련된 정보를 가지고 있는 객체
	// HttpServletRequest request : Http 요청 정보를 담고 있는 객체 (헤더, 파라미터, URI, ..) 
	// HttpSession session: 세션 정보를 저장하고 관리
	// ServletContext application: 웹 애플리케이션 전역에 설정정보와 리소스 관리

	// pageContext.setAttribute("속성명", "값");
	// 내장객체 속성, 값 지정
	pageContext.setAttribute("id1", "aaa");
	request.setAttribute("id2", "bbb");
	session.setAttribute("id3", "ccc");
	application.setAttribute("id4", "ddd");

	// 내장객체 담기 속성 값 꺼내기
	Object obj1 = pageContext.getAttribute("id1");
	System.out.println("id1 : " + obj1.toString()); // 출력 aaa
	// Object 클래스에 있는 toString아니고 String에 있는 toString 을 가져온 것

	Object obj2 = request.getAttribute("id2");
	String id2 = (String) obj2;
	System.out.println("id2 : " + id2); // 출력 bbb
	// 이 과정을 거친 것이 위에 있는 것

	Object obj3 = session.getAttribute("id3");
	System.out.println("id3 : " + obj3); // ccc

	Object obj4 = application.getAttribute("id4");
	System.out.println("id4 : " + obj4); // ddd

	// 없는 거 출력하면 어케 돼? 안돼
	/* Object obj5 = session.getAttribute("id5");
	System.out.println(obj5.toString()); // ddd  */

	// 다른 페이지 이동
	// 1. forward 
	/* RequestDispatcher rd = request.getRequestDispatcher("page2.jsp");
	rd.forward(request, response); */
	// pageContext는 페이지 넘어가면서 데이터 안가져옴
	// request 객체가 유효함 
	// 즉 나머지 세개는 값 가져옴

	// 2. redirect // request 객체가 유효하지 않음 
	response.sendRedirect("page2.jsp");
	// pageContext는 페이지 넘어가면서 데이터 안가져옴
	// request는 페이지 넘어가면서 데이터 안가져옴

	/* Session은 세션이 살아있을동안 데이터가 저장되어있음 /
	/ application은 서버가 살아있는 동안 데이터가 저장되어있음 */
	%>

</body>
</html>