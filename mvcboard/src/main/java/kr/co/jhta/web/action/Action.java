package kr.co.jhta.web.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	public String execute(HttpServletRequest req, HttpServletResponse resp);
}
