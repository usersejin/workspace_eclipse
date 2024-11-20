package day01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 서블릿:
// localhost:8080/web/hobby2.do 요청에 응답하는 서블릿
@WebServlet("/hobbby2.do")
public class hobbby2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hobby = req.getParameter("hobby"); // 수영
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1> 당신의 취미는 !!!!! " + hobby + "입니다. </h1>");
		out.println("</body>");
		out.println("</html>");
	}

}
