package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;

public class MemberDAO {

	// 1. 환경변수
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String user = "scott";
	final static String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public MemberDAO() {
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
	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> list = new ArrayList<>();
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT MEMNO, NAME, ID, PW, REGDATE, GENDER, MOTIVE ");
		sb.append("FROM MEMBER");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 로직 처리
			while (rs.next()) {
				int memno = rs.getInt("memno");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String regdate = rs.getString("regdate");
				String gender = rs.getString("gender");
				String motive = rs.getString("motive");
				list.add(new MemberVO(memno, name, id, pw, regdate, gender, motive));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	// 한건 조회
	public MemberVO selectOne() {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT MEMNO, NAME, ID, PW, REGDATE, GENDER, MOTIVE ");
		sb.append("FROM MEMBER ");
		sb.append("WHERE MEMNO = ?");

		MemberVO vo = null;
		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getMemno());

			// 6. 실행
			rs = pstmt.executeQuery();
			pstmt.setInt(1, vo.getMemno());

			// 7. 로직 처리
			while (rs.next()) {
				int memno = rs.getInt("memno");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String regdate = rs.getString("regdate");
				String gender = rs.getString("gender");
				String motive = rs.getString("motive");
				vo = new MemberVO(memno, name, id, pw, regdate, gender, motive);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// insert
	public void insertOne(MemberVO vo) {
		// 4. SQL문 작성
		sb.setLength(0);
		sb.append("INSERT INTO MEMBER VALUES (MEMBER_MEMNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?)");

		try {
			// 5. 문장 객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPw());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getMotive());

			// 6. 실행
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// update
	public void updateOne(MemberVO vo) {
		sb.setLength(0);
		sb.append("UPDATE MEMBER SET NAME = ?, REGDATE = SYSDATE, ID = ?  WHERE MEMNO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getMemno());

			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// delete
	public void deleteOne(int memno) {
		sb.setLength(0);
		sb.append("DELETE FROM MEMBER WHERE MEMNO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, memno);

			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 아이디와 비밀번호로 사람 찾기
	public MemberVO findOneByIdAndPw(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT MEMNO, NAME, ID, PW, REGDATE, GENDER, MOTIVE ");
		sb.append("FROM MEMBER ");
		sb.append("WHERE ID = ? AND PW = ?");
		MemberVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 데이터가 있음
				int memno = rs.getInt("memno");
				String name = rs.getString("name");
				String regdate = rs.getString("regdate");
				String gender = rs.getString("gender");
				String motive = rs.getString("motive");
				vo = new MemberVO(memno, name, id, pw, regdate, gender, motive);

			} else {
				// 데이터가 없음 (그런사람 없음)
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
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
