package day08;

/*파일 여러개 가져오기*/

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import dao.FileDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vo.FileVO;

@WebServlet("/upload2.do")
@MultipartConfig( // 파일 업로드 처리를 위한 설정정보(제약)를 담는 annotation
		fileSizeThreshold = 1024 * 1024 * 2, // 파일 크기의 임계값 : 2MB -> 이 크기를 초과하면 디스크에 임시파일로 저장
		maxFileSize = 1024 * 1024 * 30, // 최대 파일 크기 : 30MB
		maxRequestSize = 1024 * 1024 * 60 // 요청의 최대 사이즈
)

public class UploadServlet2 extends HttpServlet {

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

		FileDAO dao = new FileDAO();
		// 여러개 가져와야하므로 복수형 Parts
		for (Part part : req.getParts()) {
			if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
				String fileName = getFileName(part);
				// 유니크한 파일명 만들기
				// UUID (Universally Unique Identifier)
				// 전 세계적으로 고유한 식별자를 생성하기 위한 클래스
				
				String uuid = "" + UUID.randomUUID();
				fileName = uuid + "_" + fileName;
				System.out.println("파일명 : " + fileName);

				FileVO vo = new FileVO(0, title, writer, contents, fileName);

				dao.addOne(vo);

				String filePath = uploadPath + File.separator + fileName;
				part.write(filePath); // 이 디렉토리에 파일 저장
				resp.getWriter().println("file upload successfully" + fileName);

			}

		}

//		// 파일이 없는 경우
//		resp.getWriter().println("No file was uploaded");
		
		// 다운로드 페이지로 이동
		resp.sendRedirect("/web/day08/view.jsp");
	}

	private String getFileName(Part filePart) {
		for (String content : filePart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				// 업로드된 파일의 이름을 가져와서 첫번째 등호 (=) 다음의 따옴표 안에 있는 내용만(전체 길이 전까지만)을 출력하는 것
				return content.substring(content.indexOf("=") + 2, content.length() - 1);

			}

		}

		return null;
	}

}
