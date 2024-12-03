package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.DeptVO;

public class DeptDAO {

	// 1. 환경변수
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public DeptDAO() {
		try {
			// 2. 드라이버에 클래스 로딩
			Class.forName(driver);
			// 3. Connection
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	} // end of constructor

	// 1건 조회
	public DeptVO selectOne(int deptno) {

		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT DEPTNO, DNAME, LOC ");
		sb.append("FROM DEPT ");
		sb.append("WHERE DEPTNO = ?");

		DeptVO vo = null;
		try {
			// 5. 문장 객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 레코드별 로직처리
			while (rs.next()) {
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				vo = new DeptVO(deptno, dname, loc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	// 전체 조회
	public ArrayList<DeptVO> selectAll() {
		ArrayList list = new ArrayList<>();

		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("SELECT DEPTNO, DNAME, LOC ");
		sb.append("FROM DEPT ");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());

			// 6. 실행
			rs = pstmt.executeQuery();

			// 7. 레코드별 로직 처리
			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				list.add(new DeptVO(deptno, dname, loc));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

	// insert
	public void insertOne(DeptVO vo) {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("INSERT INTO DEPT VALUES (DEPT_DEPTNO.NEXTVAL, ?, ?)");

		// 5. 문장객체 생성
		try {
			pstmt = conn.prepareStatement(sb.toString());
//			pstmt.setInt(1, vo.getDeptno());
			pstmt.setString(1, vo.getDname());
			pstmt.setString(2, vo.getLoc());

			// 6. 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// Update
	public void updateOne(DeptVO vo) {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("UPDATE DEPT SET DNAME = ?, LOC = ? WHERE DEPTNO = ?");

		try {
			// 5. 문장객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getDname());
			pstmt.setString(2, vo.getLoc());
			pstmt.setInt(3, vo.getDeptno());

			// 6. 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// Delete
	public void deletOne(int deptno) {
		// 4. SQL 문 작성
		sb.setLength(0);
		sb.append("DELETE FROM DEPT WHERE DEPTNO = ? ");

		try {
			// 5. 문장객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			// 6. 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
