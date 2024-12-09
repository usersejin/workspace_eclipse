//MVC에서 Controller
package ex2;
import java.io.IOException;

import ex2.HelloCommand;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// localhost:8080/mvc/mc             ==> ex3/hello.jsp
// localhost:8080/mvc/mc?type=hello  ==> ex3/hello.jsp
// localhost:8080/mvc/mc?type=ip  ==> ex3/ip.jsp
// 접속한 사용자의 IP address를 msg를 담아, IpCommand 클래스의 execute(req, resp)로 해서 ..
// ip.jsp에서는 전달받은 ip를 출력

// localhost:8080/mvc/mc?type=dept  ==> ex3/dept.jsp (출력)
// DeptCommand execute(req, resp) ==> 전체 부서의 목록
// jdbc 드라이버, lombok, dao, vo

// localhost:8080/mvc/mc?type=now  ==> ex3/now.jsp (출력)
// NowCommand execute(req, resp); ==> msg 변수에 현재시간 출력
@WebServlet("/mc")
public class MyController3 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 한글처리
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		// 2. 파라미터값 가져오기
		String type = req.getParameter("type");
		
		// 3. 찾아가야할 페이지 url을 갖는 변수
		String url = "";

		if (type == null || type.equals("hello")) {
			ActionCommand ac = new HelloCommand();
			url = ac.execute(req, resp); // url 을 리턴값을 받아서 이동하게 끔 함
		} else if (type.equals("ip")) {
			ActionCommand ic = new IpCommand();
			url = ic.execute(req, resp);
		} else if (type.equals("dept")) {
			DeptCommand dc = new DeptCommand();
			url = dc.execute(req, resp);
		} else if (type.equals("now")) {
			ActionCommand nc = new NowCommand();
			url = nc.execute(req, resp);
		}
			
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

}
