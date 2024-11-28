<%@page import="vo.FileVO"%>
<%@page import="dao.FileDAO"%>
<%@page import="java.util.Enumeration"%>
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
		// cos.jar 
		// request:  요청 객체
		// saveDir : 저장파일의 위치 (savedirectory)
		// maxFileSize : 최대 파일의 사이즈
		// UTF-8 : 문자 캐릭터셋
		// DefaultFileRenamePolicy() : 동일한 이름의 파일이 업로드된다면 어떻게 처리할지에 대한 정책
		
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
		// javax.패키지..
		// jakarta
		
		// request 대신 mr
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String contents = mr.getParameter("contents");
		
		// file 에 대한 정보를 더 알고싶다면
		// Enumeration => 열거형
		
		out.println("<h2>" + title + "</h2>");
		out.println("<h2>" + writer + "</h2>");
		out.println("<h2>" + contents + "</h2>");
		
		Enumeration files = mr.getFileNames();
		while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			String filename = mr.getFilesystemName(name);
			String type = mr.getContentType(name);
			out.println("<h2> 요청 파라미터 이름 : " + name + "</h2>"); // 파일을 요청한 파라미터의 이름을 알 수 있음
			out.println("<h2> 저장 파일명 : " + filename + "</h2>"); // 파일명을 알 수 있음
			out.println("<h2> 콘텐츠 타입 : " + type + "</h2>"); // png인지 알 수 있음
			FileDAO dao = new FileDAO();
			FileVO vo = new FileVO(0, title, writer, contents, filename);
			dao.addOne(vo);
		}
		
		/* String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String file = request.getParameter("filename");
	
		out.println(title);
		out.println(writer);
		out.println(contents);
		out.println(file); */
	%>
	
	<a href="view.jsp">이미지 보러가기</a>
	
</body>
</html>