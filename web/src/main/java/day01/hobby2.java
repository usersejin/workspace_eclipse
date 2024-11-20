package day01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hobby2.do")
public class hobby2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 여러개 선택할 때 -> 복수개로 받아줌 -> 배열로 넘겨받음
		String[] hobbyList = req.getParameterValues("hobby");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app </title>");
		out.println("</head>");
		out.println("<body>");
		for (int i = 0; i < hobbyList.length; i++) {
			out.println("<h1> 당신의 취미는 ~~~~ " + hobbyList[i] + "입니다. </h1>");
		}
		out.println("</body>");
		out.println("</html>");
	}

}
