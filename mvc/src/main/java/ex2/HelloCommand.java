package ex2;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloCommand implements ActionCommand {
	// 요청객체와 응답객체를 매개변수로 갖는 execute 메서드를 갖고있어야 함
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("msg", "이건 모델에서 전달해주는 데이터");
		// 리턴값은 찾아가야할 JSP 파일의 위치를 반환
		return "ex3/hello.jsp";
	}

}
