package ex2;

import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NowCommand implements ActionCommand{

	public String execute(HttpServletRequest req, HttpServletResponse resp) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date d = new Date();
//	String now = sdf.format(d);
//	req.setAttribute("now", now);
	req.setAttribute("now", sdf.format(d));
		
		return "ex3/now.jsp";
	}

}
