package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.EmpVO;

public class EmpDAO {
	// 1. 변수 선언
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "scott";
	private String password = "tiger";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public EmpDAO() {
		try {
			// 2. JDBC 드라이버에 로딩되어 있는지 여부 체크
			Class.forName(driver);
			// 3. 연결 (Connection)
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}

	// SelectOne
	public EmpVO selectOne(int empno) {
		EmpVO vo = null;

		// 4. SQL 작성
		sb.setLength(0); // StringBuffer 초기화
		sb.append("SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO ");
		sb.append("FROM EMP ");
		sb.append("WHERE EMPNO = ?");

		try {
			// 5. 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, empno);

			// 6. 실행 (SELECT => ResultSet 객체 반환)
			rs = pstmt.executeQuery();

			// 7. 레코드별 로직 처리
			if (rs.next()) {
				vo = EmpVO.builder().empno(rs.getInt("empno")).ename(rs.getString("ename")).job(rs.getString("job"))
						.mgr(rs.getInt("mgr")).hiredate(rs.getString("hiredate")).sal(rs.getInt("sal"))
						.comm(rs.getInt("comm")).deptno(rs.getInt("deptno")).build();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	// SelectAll
	public ArrayList<EmpVO> selectAll() {
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();

		sb.setLength(0);
		sb.append("SELECT EMPNO, ENAME, JOB, MGR, TO_CHAR(HIREDATE, 'YYYY/MM/DD') HIREDATE, SAL, COMM, DEPTNO ");
		sb.append("FROM EMP ");

		// TO_CHAR(HIREDATE, 'YYYY/MM/DD') HIREDATE 별칭까지 해줘야지 HIREDATE 에서 찾게 돼

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			EmpVO vo = null;

			while (rs.next()) {
				vo = EmpVO.builder().empno(rs.getInt("empno")).ename(rs.getString("ename")).job(rs.getString("job"))
						.mgr(rs.getInt("mgr")).hiredate(rs.getString("hiredate")).sal(rs.getInt("sal"))
						.comm(rs.getInt("comm")).deptno(rs.getInt("deptno")).build();
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// Insert
	public void insertOne(EmpVO vo) {

		sb.setLength(0);
		sb.append("INSERT INTO EMP VALUES (EMP_EMPNO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?, ?)");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
//			pstmt.setInt(1, vo.getEmpno());
			pstmt.setString(1, vo.getEname());
			pstmt.setString(2, vo.getJob());
			pstmt.setInt(3, vo.getMgr());
			pstmt.setInt(4, vo.getSal());
			pstmt.setInt(5, vo.getComm());
			pstmt.setInt(6, vo.getDeptno());

			// 6. 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// Update
	public void updateOne(EmpVO vo) {

		// 4. sql 문 작성
		sb.setLength(0);
		sb.append("UPDATE EMP SET JOB = ?, SAL = ?, COMM = ?, HIREDATE = SYSDATE ");
		sb.append("FROM EMP ");
		sb.append("WHERE EMPNO = ?");

		try {
			// 5. 문장객체
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getJob());
			pstmt.setInt(2, vo.getSal());
			pstmt.setInt(3, vo.getComm());
			pstmt.setInt(4, vo.getEmpno());

			// 6. 실행
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// findEmpnoByName
	public EmpVO findEmpnoByName(String keyword) {

		sb.setLength(0);
		sb.append("SELECT EMPNO ");
		sb.append("FROM EMP ");
//		sb.append("WHERE ENAME = ? ");
		sb.append("WHERE ENAME LIKE ?");

		EmpVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + keyword + "%");

			rs = pstmt.executeQuery();

			if (rs.next()) {
//				vo = EmpVO.builder().empno(rs.getInt("empno")).build();
				int empno = rs.getInt("empno");
				vo = new EmpVO();
				vo.setEmpno(empno);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	// Delete
	public void deleteOne(int empno) {

		sb.setLength(0);
		sb.append("DELETE FROM EMP WHERE EMPNO = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, empno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

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
			System.out.println("DB 접속 해제");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}