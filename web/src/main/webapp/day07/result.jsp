<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		// upload 디렉토리에 실제 운영체제 상 경로 얻어오기
		String saveDir = application.getRealPath("/upload");
		
		out.println(saveDir);
		// 전송 파일의 최대 사이즈 : 30MB
		// 1KB*1024 ==> 1MB*30 ==> 30MB
		int maxFileSize = 1024*1024*30;
	
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
		// javax.패키지..
		// jakarta
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String file = request.getParameter("filename");
	
		out.println(title);
		out.println(writer);
		out.println(contents);
		out.println(file);
	
	%>
	
</body>
</html>