<!-- main.jsp 에서 블럭 조립하듯이 action tag 사용하기 -->
<!-- header,nav,news,sidebar,footer.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>

	<%
	// JSP(Java Server Page) 의 단편화(fragmentation)
	// 모듈화하거나 재사용을 높이기 위해 코드를 여러 조각으로 나누는 것
	String fname = "";
	String name = request.getParameter("name");
	out.println(name);

	if (name == null) {
		fname = "news.jsp";
	} else {
		fname = name + ".jsp";
	}
	%>
	
	<div id = "container">
		<!-- JSP Action tag -->
		<!-- 단독태그 <ㅁㅁ/>로 해야지 오류가 안나 쌍 태그하면 <>안에 컨텐츠 있어야함</>  -->
		<jsp:include page="header.jsp" /> 
		<jsp:include page="nav.jsp" />
		<jsp:include page="<%= fname %>" /> <!-- news.jsp()로 연결되는거ㄴ임 -->
		<jsp:include page="sidebar.jsp" /> 
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>