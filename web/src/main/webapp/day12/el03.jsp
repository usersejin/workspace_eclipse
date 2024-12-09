<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el03.jsp</title>
</head>
<body>
<%
	String n1 = request.getParameter("no1");
	String n2 = request.getParameter("no2");
	
	int no1 = 0;
	int no2 = 0;
	int result = 0;
	
	if(n1 != null && n2 != null){
		no1 = Integer.parseInt(n1);
		no2 = Integer.parseInt(n2);
		result = no1 + no2;
	

%>
	<form action="">
		<input type="text" name="no1" id="" value="<%= n1 %>" /> +
		<input type="text" name="no2" id="" value="<%= n2 %>"/>
		<input type="submit" value="=" id="" />
		<input type="text" name="no3" id="" value="<%= result %>"/>
	</form>
<%
	}else{ // 초기 화면에 null이라고 뜨는 것을 없애기 위해 if else 문을 사용함
%>
	<form action="">
		<input type="text" name="no1" id=""/> +
		<input type="text" name="no2" id=""/>
		<input type="submit" value="=" id=""/>
		<input type="text" name="no3" id=""/>
	</form>
<% 
} 
%>
</body>
</html>