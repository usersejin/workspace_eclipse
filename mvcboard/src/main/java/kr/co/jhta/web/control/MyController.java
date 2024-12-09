package kr.co.jhta.web.control;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.web.action.Action;
import kr.co.jhta.web.action.DetailAction;
import kr.co.jhta.web.action.ListAction;
import kr.co.jhta.web.action.ModifyAction;
import kr.co.jhta.web.action.ModifyOkAction;
import kr.co.jhta.web.action.WriteAction;
import kr.co.jhta.web.action.WriteFormAction;
import kr.co.jhta.web.action.deleteAction;

@WebServlet("/board.do")
public class MyController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		// 2. cmd 파라미터 값 가져오기
		String cmd = req.getParameter("cmd");
		String url = "";

		// 3. cmd == null || cmd.equals("list")
		if (cmd == null || cmd.equals("list")) {
			Action action = new ListAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("detail")) {
			Action action = new DetailAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("write")) {
			Action action = new WriteFormAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("writeOk")) {
			Action action = new WriteAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("modify")) {
			Action action = new ModifyAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("modifyOk")) {
			Action action = new ModifyOkAction();
			url = action.execute(req, resp);
		} else if (cmd.equals("delete")) {
			Action action = new deleteAction();
			url = action.execute(req, resp);
		}
		// 4. views/list.jsp 이동
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

}
