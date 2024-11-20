package day01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 서블릿

// localhsot:8080/web/hobby.do

//h3 태그로 Hello Servlet World 출력
@WebServlet("/hobby.do")
public class hobby extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답 객체로부터 쓰기 객체를 얻어옴
		PrintWriter out = resp.getWriter();
		String hobby = req.getParameter("hobby");
		
		// 쓰기 객체로부터 출력하면 이 내용이 사용자 브라우저에게 전달
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2> 당신의 취미는 " + hobby + "입니다. </h2>");
		
		out.println("</body>");
		out.println("</html>");
	}
	
	

}
