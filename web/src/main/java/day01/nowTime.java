package day01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/now.do")
public class nowTime extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("현재시간 yyyy년 MM월 dd일 HH:mm:ss 입니다."); // "패턴 설정"
		String time = sdf.format(d);

		PrintWriter out = resp.getWriter();
		String dTime = req.getParameter("dTime");

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
//		out.println("<h3> 현재시간은 " + (d.getYear() + 1900) + "년 " + d.getMonth() + "월 " + d.getDate() + "일 "
//				+ d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초입니다. </h3>");
		out.println("<h3>" + time + "</h3>");

		out.println("</body>");
		out.println("</html>");
	}

}
