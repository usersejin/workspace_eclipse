package kr.co.jhta.web.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.web.dao.BoardDAO;
import kr.co.jhta.web.vo.BoardVO;

public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 파라미터값 가져와서 db에 저장
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		// dao, vo 만들어 값을 담고
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		// db에 수정하고
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContents(contents);
		vo.setIp(req.getRemoteAddr());
		dao.insertOne(vo);
		
		// 리스트로 이동
		return "board.do?cmd=list";
	}

}
