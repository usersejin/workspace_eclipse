package day02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//  		 webapp/img/ball1.png
@WebServlet("/day2/bigchance.do")
public class BigChance extends HttpServlet {

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		// 2. 쓰기 객체
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'/>");
		out.println("<title> second web app</title>");
		out.println("</head>");
		out.println("<body>");
		// 로또공 이미지
//		out.println("<img src = '../img/ball1.png'>");
		out.println("</body>");
		out.println("</html>");

		// 3. 출력 ==> 사용자 브라우저 전달

		NewLotto nl = new NewLotto(1);
		nl.shuffle();
		nl.select();
		nl.sort();

		int[] m = nl.getM();

		// 반복문 사용해서 로또공 이미지가 출력되도록 나머지 코드를 작성..
		for (int i = 0; i < m.length; i++) {
			out.println("<img src = '../img/ball" + m[i] + ".png'>");
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

}
