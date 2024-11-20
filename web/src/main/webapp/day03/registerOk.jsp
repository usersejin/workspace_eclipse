<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerOk.jsp</title>
</head>
<body>

 	<% 
 		String gender = request.getParameter("gender");
 		String id = request.getParameter("id");
 		String password = request.getParameter("password");
 		String name = request.getParameter("name");
 		
 		MemberDAO dao = new MemberDAO();
 		MemberVO vo = new MemberVO();
 		
 		vo.setGender(gender);
 		vo.setId(id);
 		vo.setPw(password);
 		vo.setName(name);
 		vo.setMotive("그냥");
 		
 		dao.insertOne(vo);
 	%>
 	<h3>축하합니다. 3초 후 로그인 페이지로 이동시킴</h3>
 	
 	<script type="text/javascript">
 	function test(){
 		window.location.href = "login.jsp";
 	}
 	window.setTimeout(test, 3000);
 	</script>

</body>
</html>