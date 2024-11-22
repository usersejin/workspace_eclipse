package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AmazonVO;

public class AmazonDAO {
	// 1. 환경변수
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String user = "scott";
	final static String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public AmazonDAO() {
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
	public ArrayList<AmazonVO> selectAll() {
		ArrayList<AmazonVO> list = new ArrayList<>();
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT NO, NAME, EMAIL, PASSWORD ");
		sb.append("FROM A_MEMBER");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 로직 처리
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String pw = rs.getString("pw");
				list.add(new AmazonVO(no, name, email, pw));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	// 한건 조회
	public AmazonVO selectOne() {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT NO, NAME, EMAIL, PASSWORD ");
		sb.append("FROM A_MEMBER ");
		sb.append("WHERE EMAIL = ?");

		AmazonVO vo = null;
		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getEmail());

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 로직 처리
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String pw = rs.getString("pw");
				vo = new AmazonVO(no, name, email, pw);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// insert
	public void insertOne(AmazonVO vo) {
		// 4. SQL문 작성
		sb.setLength(0);
		sb.append("INSERT INTO A_MEMBER VALUES (?, ?, ?, ?)");

		try {
			// 5. 문장 객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPw());

			// 6. 실행
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// update
	public void updateOne(AmazonVO vo) {
		sb.setLength(0);
		sb.append("UPDATE A_MEMBER SET PASSWORD = ? WHERE NO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getPw());
			pstmt.setInt(2, vo.getNo());

			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// delete
	public void deleteOne(int no) {
		sb.setLength(0);
		sb.append("DELETE FROM A_MEMBER WHERE NO = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);

			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 이메일로 이름 찾는 메서드 -> AmazonloginOk() 에서 가입완료하면 ~님 에서 이름 가져와야하므로
	public AmazonVO findOneByEmail(String email, String pwd) {
		sb.setLength(0);
		sb.append("SELECT NO, NAME, PASSWORD, EMAIL ");
		sb.append("FROM A_MEMBER ");
		sb.append("WHERE EMAIL = ? AND PASSWORD = ?");
		AmazonVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				vo = new AmazonVO(no, name, email, pwd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	// 자원 해제 메서드
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
