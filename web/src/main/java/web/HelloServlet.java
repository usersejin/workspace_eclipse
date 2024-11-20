package web;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// servlet : server side applet
// 웹에서 동작하는 자바 프로그램
// 동적 웹 페이지 작성 가능

// 윈도우 창 만들기 -> HttpServlet 상속받기
// 1. HttpServlet 상속
// 2. doGet() Override
// 3. 만든 servlet을 웹 서버에 등록
// 3-1. 클래스 상단에 @WebServlet("/hello.do")

@WebServlet("/hello.do")
public class HelloServlet extends HttpServlet {
	// req : 사용자의 요청을 객체로 만든 것
	// resp : 서버의 응답을 객체로 만든 것
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> first web app</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>첫 서블릿</h2>");
		for (int i = 0; i < 100; i++) {
			out.println("<h2>my first Servlet!</h2>");
		}
		out.println("</body>");
		out.println("</html>");
	}

}
