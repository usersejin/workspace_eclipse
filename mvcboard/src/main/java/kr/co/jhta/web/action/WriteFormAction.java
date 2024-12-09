package kr.co.jhta.web.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteFormAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		return "views/write.jsp";
	}

}
