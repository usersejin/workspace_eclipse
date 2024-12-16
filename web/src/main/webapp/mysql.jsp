<!-- oracle이 아닌 mysql에서 DB 연결하기는거 보여주는 JSP -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mysql.jsp</title>
</head>
<body>
<%

//1. 환경변수
	// oracle에서는 
	// String driver = "oracle.jdbc.driver.OracleDriver";
	// String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	// mysql에서는
	String driver = "com.mysql.cj.jdbc.Driver";
	// String url = "jdbc:mysql://서버IP:port번호/dbname";
	String url = "jdbc:mysql://localhost:3306/xe";
	String user = "scott";
	String password = "TigerTiger12$$";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, user, password);
	out.println(conn);
%>
</body>
</html>