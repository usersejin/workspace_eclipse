package kr.co.jhta.web.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.web.dao.BoardDAO;
import kr.co.jhta.web.vo.BoardVO;

public class ModifyOkAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String b = req.getParameter("bno");
		int bno = Integer.parseInt(b);
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContents(contents);
		vo.setBno(bno);
		vo.setIp(req.getRemoteAddr());
		dao.updateOne(vo);
		return "board.do?cmd=list";
	}

}
