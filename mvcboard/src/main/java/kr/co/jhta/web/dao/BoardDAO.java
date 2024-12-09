package kr.co.jhta.web.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.border.Border;

import kr.co.jhta.web.vo.BoardVO;


public class BoardDAO {
	// 1. 환경변수
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String user = "scott";
	final static String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public BoardDAO() {
		try {
			// 2. 클래스에 드라이브 로딩
			Class.forName(driver);
			// 3. connection
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 전체 조회
	public ArrayList<BoardVO> selectAll(int startNo, int endNo) {
		ArrayList<BoardVO> list = new ArrayList<>();
		// 4. SQL 문 작성
		// 게시글 20개만 가져오기
		sb.setLength(0);
		sb.append("SELECT RN, BNO, WRITER, TITLE, CONTENTS, REGDATE, HITS, IP, STATUS ");
		sb.append("FROM (SELECT ROWNUM RN, BNO, WRITER, TITLE, CONTENTS, REGDATE, HITS, IP, STATUS ");
		sb.append("FROM ( SELECT BNO, WRITER, TITLE, CONTENTS, REGDATE, HITS, IP, STATUS ");
		sb.append("FROM BOARD ");
		sb.append("ORDER BY BNO DESC) ");
		sb.append("WHERE ROWNUM <= ?) ");
		sb.append("WHERE RN >= ? ");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 로직 처리
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");
//					BoardVO vo = new BoardVO(bno, writer, title, contents, regdate, hits, status, ip);

				// builder로 vo 설정하기
				BoardVO vo = BoardVO.builder().bno(bno).title(title).writer(writer).contents(contents).regdate(regdate)
						.hits(hits).ip(ip).status(status).build();
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	// 한건 조회
	public BoardVO selectOne(int bno) {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT BNO, WRITER, TITLE, CONTENTS, REGDATE, HITS, IP, STATUS ");
		sb.append("FROM BOARD ");
		sb.append("WHERE BNO = ?");

		BoardVO vo = null;
		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 로직 처리
			while (rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String regdate = rs.getString("regdate");
				int hits = rs.getInt("hits");
				String ip = rs.getString("ip");
				int status = rs.getInt("status");

				// set으로 vo 설정하기
				vo = new kr.co.jhta.web.vo.BoardVO();
				vo.setBno(bno);
				vo.setWriter(writer);
				vo.setTitle(title);
				vo.setContents(contents);
				vo.setRegdate(regdate);
				vo.setHits(hits);
				vo.setIp(ip);
				vo.setStatus(status);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// insert
//		public void insertOne(String writer, String title, String contents) {
//			// 4. SQL문 작성
//			sb.setLength(0);
//			sb.append("INSERT INTO BOARD VALUES (BOARD_BNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)");
//
//			try {
//				// 5. 문장 객체
//				pstmt = conn.prepareStatement(sb.toString());
//				pstmt.setString(1, writer);
//				pstmt.setString(2, title);
//				pstmt.setString(3, contents);
//				
//
//				// 6. 실행
//				pstmt.executeQuery();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}

	// insert
	public void insertOne(BoardVO vo) {
		// 4. SQL문 작성
		sb.setLength(0);
		sb.append("INSERT INTO BOARD VALUES (BOARD_BNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, 1)");

		try {
			// 5. 문장 객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getIp());

			// 6. 실행
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// update
	public void updateOne(BoardVO vo) {
		sb.setLength(0);
		sb.append("UPDATE BOARD SET WRITER = ?, TITLE = ?, CONTENTS = ?  WHERE BNO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContents());
			pstmt.setInt(4, vo.getBno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// delete
	public void deleteOne(int bno) {
		sb.setLength(0);
		sb.append("DELETE FROM BOARD WHERE BNO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 조회수 증가 메서드
	public void raiseHits(int bno) {

		sb.setLength(0);
		sb.append("UPDATE BOARD ");
		sb.append("SET HITS = HITS+1 "); // 조회수 1증가
		sb.append("WHERE BNO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// 총 게시글 개수
	// 페이지네이션을 하기 위한..
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) AS CNT FROM BOARD ");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
		
	}
	

	// 8. 자원반납
	public void close() {
		{
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
