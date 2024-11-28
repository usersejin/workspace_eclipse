package day08;

/*servlet을 통해 다운로드 하기*/

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import dao.FileDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vo.FileVO;


// localhost:8080/web/download?no=3
// 3번 글에 첨부파일 다운로드 받기
@WebServlet("/download.do")
public class DownloadServlet extends HttpServlet {
	
	private static final String UPLOAD_DIRECTORY = "upload"; 
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// no라는 파라미터 값 가져오기
		String n = req.getParameter("no");
		
		if (n != null) {
			int no = Integer.parseInt(n);
			
			// dao
			FileDAO dao = new FileDAO();
			
			// dao.selectOne(3);
			FileVO vo = dao.selectOne(no);
			
			// FileName 알아오기
			// 우선 파일명까지만 이클립스 콘솔에 출력
			System.out.println(vo.getFilename());
			
			// 파일이 저장되어 있는 경로 (운영체제의 경로..)
			String uploadPath = getServletContext().getRealPath("")+File.separator+UPLOAD_DIRECTORY;
			// 경로 확인
			System.out.println("저장 경로 : " + uploadPath);
			
			if (vo != null) {
				File f = new File(uploadPath, vo.getFilename());
				// 파일이 존재하고 파일이 맞다면
				if (f.exists() && f.isFile()) {
					// 응답 객체에 컨텐츠의 종류 지정
					resp.setContentType("application/octet-stream");
					// 파일명이 어떤값이 헤더에 저장되는지 
					resp.setHeader("Content-Disposition", "attachment;filename="+vo.getFilename());
					
					FileInputStream fis = new FileInputStream(f);
					OutputStream os = resp.getOutputStream();
					
					byte[] buffer = new byte[4096];
					int b = 0;
					// fis.read(buffer)) 한글자 읽은 것을 b에 담고 
					while(( b = fis.read(buffer)) != -1) {
						os.write(buffer, 0, b);
						
						
					}
					
				}
			}
			
					
		}
		
		// 그 FileName을 갖고 다운로드하기
	
	}

}
