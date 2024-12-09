package kr.co.jhta.web.action;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.web.dao.BoardDAO;
import kr.co.jhta.web.vo.BoardVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {

		BoardDAO dao = new BoardDAO();

		// 페이지네이션
		// 총 게시물 :
		int totalCount = dao.getTotalCount();
		/* out.println("총 게시물 수 : " + totalCount); */
		// 한 페이지당 게시물 수 : 20
		int recordPerPage = 20;

		// 총 페이지수 301/20 => 15(0으로 나눠떨이지면) 16(0으로 나눠떨이지지 않으면)
		int totalPage = (totalCount % recordPerPage == 0) ? totalCount / recordPerPage : totalCount / recordPerPage;

		// 현재 페이지 번호 (-1은 임의의 값)
		int currentPage = -1;

		// 현재 페이지 번호 가져오기
		String cp = req.getParameter("cp");
		if (cp == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(cp);

		}

		// 페이지 시작번호
		int startNo = (currentPage - 1) * recordPerPage + 1;

		// 페이지의 끝번호
		int endNo = currentPage * recordPerPage;

		// 시작 페이지 번호
		int startPage = 1;
		// 끝 페이지 번호
		int endPage = totalPage;

		// 시작 페이지 미세조정
		startPage = Math.max(1, currentPage - 4);

		// 끝 페이지 미세조정
		endPage = Math.min(totalPage, startPage + 9);

		ArrayList<BoardVO> list = dao.selectAll(startNo, endNo);


		req.setAttribute("list", list);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("recordPerPage", recordPerPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("startNo", startNo);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endNo", endNo);
		req.setAttribute("endPage", endPage);
		req.setAttribute("currentPage", currentPage);

		return "views/list.jsp";
	}

}
