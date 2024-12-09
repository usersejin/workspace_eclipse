package ex1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 서블릿 작성방법
// 1. HttpServlet 상속
// 2. doGet() doPost() override
// 3. @webServlet

// localhost:8080/mvc/MyController?cmd=hello ==> hello.jsp 파일로 이동
// localhost:8080/mvc/MyController?cmd=ip ==> ip.jsp 파일로 이동

@WebServlet("/MyController")
public class MyController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 한글 처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		// 2. 파라미터 값 가져오기
		String cmd = req.getParameter("cmd");
		System.out.print("cmd : " + cmd);       
		
		// 3. 찾아가야할 페이지 url을 갖는 변수
		String url="";
		
		// 전달할 데이터를 담을 변수
		String msg = "";
		
		// cmd가 null 이거나 cmd가 hello 이면 (null 이면 항상 참이므로 뒤의 조건은 검사하지 않음)
		if(cmd == null || cmd.equals("hello")) { 
			System.out.print("cmd : " + cmd);  
			url = "hello.jsp";
			msg = "안녕하세요";
			// msg는 이 페이지에서 끝나는 변수이므로 ip 까지 가져가려면 
			// request 객체에 담아서 보내줘야 해(페이지 이동이니까 scope 고려해서)
			req.setAttribute("msg", msg);
		} else if (cmd.equals("ip")) {
			url = "ip.jsp";
			msg = req.getRemoteAddr();
			req.setAttribute("msg", msg);
		}
		
		// hello.jsp로 forward
		// controller를 통해 view로 
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		
	}
	
	

}
