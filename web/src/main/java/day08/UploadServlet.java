package day08;

import java.io.File;
import java.io.IOException;

import dao.FileDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vo.FileVO;

@WebServlet("/upload1.do")
@MultipartConfig( // 파일 업로드 처리를 위한 설정정보(제약)를 담는 annotation
		fileSizeThreshold = 1024*1024*2, // 파일 크기의 임계값 : 2MB -> 이 크기를 초과하면 디스크에 임시파일로 저장
		maxFileSize = 1024*1024*30, // 최대 파일 크기 : 30MB
		maxRequestSize = 1024*1024*60 // 요청의 최대 사이즈
		)

public class UploadServlet extends HttpServlet {
	
	// 파일 저장경로
	private static final String UPLOAD_DIRECTORY = "upload";
	
	
	// fileupload는 post 방식만 요청하기 때문에 get 은 작성하지 않음
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 절대 경로 위치 getServletContext -> jsp 에서는 application임
		// File.separator + UPLOAD_DIRECTORY -> 우리가 쓰는 파일 경로.. 임 (?)
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY; 
	
		System.out.println(uploadPath);
		
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");
		
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) { // 해당 디렉토리가 없으면
			uploadDir.mkdir(); // 디렉토리 생성해
		}
		
		// 요청으로부터 파일 파트 가져오기
		Part filePart = req.getPart("filename");
		
		if(filePart != null) {
			// 업로그된 파일 이름 가져오기
			String fileName = getFileName(filePart);
			System.out.println("파일명 : " + fileName);
			
			FileDAO dao = new FileDAO();
			FileVO vo = new FileVO(0, title, writer, contents, fileName);
			
			dao.addOne(vo);
			
			// 파일 이름이 널이 아니고 비어있지 않다면
			if (fileName != null && !fileName.isEmpty()) {
				// 파일 저장 경로
				String filePath = uploadPath + File.separator + fileName;
				filePart.write(filePath); // 이 디렉토리에 파일 저장
				resp.getWriter().println("file upload successfully" + fileName);
				return;
			}
		}
		
		// 파일이 없는 경우
		resp.getWriter().println("No file was uploaded");
	}


	private String getFileName(Part filePart) {
		for(String content : filePart.getHeader("content-disposition").split(";")) {
			if(content.trim().startsWith("filename")) {
				// 업로드된 파일의 이름을 가져와서 첫번째 등호 (=) 다음의 따옴표 안에 있는 내용만(전체 길이 전까지만)을 출력하는 것
				return content.substring(content.indexOf("=")+2, content.length()-1);
				
			}
			
		}
		
		return null;
	}
	
	

}
