package ex2;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// localhost:8080/mvc/MyControl
// localhost:8080/mvc/MyControl?cmd=kr ==> ex2/korea.jsp
// localhost:8080/mvc/MyControl?cmd=cn ==> ex2/cn.jsp
// localhost:8080/mvc/MyControl?cmd=jp ==> ex2/japan.jsp

@WebServlet("/MyControl")
public class MyController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		// 2. 파라미터값 가져오기
		String cmd = req.getParameter("cmd");

		// 3. 찾아가야할 페이지의 url을 갖는 변수
		String url = "";

		// 전달할 데이터를 담을 변수
		String msg = "";

		// cmd가 null 이거나 cmd가 kr이면
		if (cmd == null || cmd.equals("kr")) {
			url = "ex2/korea.jsp";
			msg = "안녀ㅕㅇ하세요";
			req.setAttribute("msg", msg);
		} else if (cmd.equals("cn")) {
			url = "ex2/cn.jsp";
			msg = "하오니";
			req.setAttribute("msg", msg);
					
		} else if (cmd.equals("jp")) {
			url = "ex2/japan.jsp";
			msg = "곤니치와";
			req.setAttribute("msg", msg);
		}

		// 해당 url로 이동
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

}
