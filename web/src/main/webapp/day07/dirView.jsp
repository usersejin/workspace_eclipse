<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dirView.jsp</title>
</head>
<body>
	<%
	// upload 디렉토리의 실제 OS경로
			String path = application.getRealPath("/upload");
		
			out.println("파일이 저장되어 있는 OS경로 : " + path);
			
			File f = new File(path);
			
			// 디렉토리인지 파일인지 판별
			// 만약 디렉토리라면
			if (f.isDirectory()) {
		// 해당 디렉토리에 있는 모든 파일의 목록을 가져오기
		String[] flist = f.list();

		for (String x : flist) {
			// 배열에 있는 모든 요소를 한개씩 꺼내 h2 태그로 만들어 출력
			out.println("<h2> " + x + "</h2>");
			 
			/* // 이미지 형태로 출력 (화면에 이미지가 보이게)
			out.println("<img src = '../upload/" + x + "'/>");		
	  */
		
		%>

		 <!-- 이미지 형태로 출력 (화면에 이미지가 보이게) -->
		<img src='../upload/" + x + "' alt="" />
		
		 <% 
			}
			}
	%>
	
</body>
</html>