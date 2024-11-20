package day02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

// 서블릿 작성방법

// 1. HttpServlet 상속
// 2. GenericServlet 상속 // 이거보다는 	1번을 더 많이 써 (왜냐면 service()만 사용가능하므로)
// 1-1. 서블릿의 생성주기와 같음
@WebServlet("/myServlet2.do")
public class MyServlet2 extends GenericServlet {
	
	@Override
	public void init() throws ServletException {
		System.out.println("초기화 메서드 호출 중"); // 초기화 단계
	}
	
	@Override
	public void destroy() {
		System.out.println("서블릿 제거 중"); // 소멸 단계
	}
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출 중"); // 실행 단계 (멀티 스레드 지원)
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<h3> service() 호출 중 </h3>");
		
		out.println("</body>");
		out.println("</html>");
	}

}
