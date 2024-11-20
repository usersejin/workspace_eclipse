package day01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 서블릿 작성

// 요청
// http://localhost:8080/web/gugudan2.do

// 브라우저에 구구단 2단 출력
// 1. HttpServlet 상속
// 2. doGet() override
// 3. 이 서블릿을 웹서버에 등록

@WebServlet("/gugudan.do") // 형식을 맞춘 유니크한 이름이어야 함
public class NGuGuDan extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ?dan=5 -> 파라미터의 값을 가져옴
		String no = req.getParameter("dan");
//		System.out.println("no : " + no);
		int dan = Integer.parseInt(no);

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		for (int i = 1; i < 10; i++) {
			out.println("<h2>" + dan + " x " + i + " = " + dan * i + "</h2>");
		}
		out.println("</body>");
		out.println("</html>");
	}

}
