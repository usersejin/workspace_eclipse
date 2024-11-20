package day02;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
// login.do ==> get, post 모두 동일하게 처리
// 화면에 id와 패스워드 출력
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LogIn extends HttpServlet{
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String queryString = req.getQueryString();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3> ID: " + id + "</h3>");
		out.println("<h3> PW: " + pw + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
