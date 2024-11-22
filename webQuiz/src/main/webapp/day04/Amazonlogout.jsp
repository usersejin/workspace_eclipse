<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // 사용자에게 보여주지 않을 코드이므로 html 요소를 갖추고 있지 않아도 됨 
    // 따라서 로그아웃 버튼 누르면 바로 로그인 페이지로 이동함
    // 굳이 로그아웃 되셨습니다. 안 띄워도 됨
    
    session.invalidate();
    response.sendRedirect("Amazonlogin.jsp");
    
    %>
</body>
</html>