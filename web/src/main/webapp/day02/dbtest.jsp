<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dbtest.jsp</title>
</head>
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	width: 400px;
	text-align: center;
}
</style>

<body>
	<%
	/* 1. 변수 선언 */
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	ResultSet rs = null; // 8번에서도 사용할 수 있도록 전여변수로 선언
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();

	/* 2. 드라이버 로딩 */
	Class.forName(driver);

	/* 3. 연결 (Connection) */
	conn = DriverManager.getConnection(url, user, password);
	/* out.println("conn: " + conn); */

	/* 4. SQL 문 작성 */
	sb.setLength(0);
	sb.append("SELECT DEPTNO, DNAME, LOC FROM DEPT");

	/* 5. 문장 객체 생성 */
	pstmt = conn.prepareStatement(sb.toString());

	/* 6. 실행 (select ==> ResultSet 객체) */
	rs = pstmt.executeQuery();

	/* 8. 자원반납 */
	%>

	<table>
		<tr>
			<td>부서번호</td>
			<td>부서명</td>
			<td>위치</td>
		</tr>

		<%
		/* 7. 레코드별 로직 처리 : db row, 프로그램 레코드 */
		while (rs.next()) {
			int deptno = rs.getInt("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
		%>
		<tr>
			<td><%=deptno%></td>
			<td><%=dname%></td>
			<td><%=loc%></td>
		</tr>

		<%
		}
		%>
	</table>

</body>
</html>