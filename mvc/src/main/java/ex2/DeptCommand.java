//MVC에서 Modelling
package ex2;
import java.util.ArrayList;

import dao.DeptDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.DeptVO;

public class DeptCommand {

	
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		DeptDAO dao = new DeptDAO();
//		ArrayList<DeptVO> list = dao.selectAll();
//		req.setAttribute("msg", list);
		req.setAttribute("list", dao.selectAll());
		
		return "ex3/dept.jsp";
	}

}
