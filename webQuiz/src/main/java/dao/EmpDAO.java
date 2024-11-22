package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.EmpVO;

public class EmpDAO {
    // DB 연결 정보
    private final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private final String USER = "scott";
    private final String PASSWORD = "tiger";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sb = new StringBuffer();

    // 기본 생성자
    public EmpDAO() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("DB 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
    }

    // 전체 조회 메서드
    public ArrayList<EmpVO> selectAll() {
        ArrayList<EmpVO> list = new ArrayList<>();
        sb.setLength(0);
        sb.append("SELECT EMPNO, ENAME, SAL, DEPTNO, HIREDATE ");
        sb.append("FROM EMP");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int empno = rs.getInt("EMPNO");
                String ename = rs.getString("ENAME");
                int sal = rs.getInt("SAL");
                int deptno = rs.getInt("DEPTNO");
                String hiredate = rs.getString("HIREDATE");

                // EmpVO 객체 생성
                EmpVO vo = new EmpVO(empno, ename, sal, deptno, hiredate);

                // 리스트에 추가
                list.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    // 1건 조회 메서드
    public EmpVO selectOne(int empno) {
        EmpVO vo = null;
        sb.setLength(0);
        sb.append("SELECT EMPNO, ENAME, SAL, DEPTNO ");
        sb.append("FROM EMP ");
        sb.append("WHERE EMPNO = ?");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, empno);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String ename = rs.getString("ENAME");
                int sal = rs.getInt("SAL");
                int deptno = rs.getInt("DEPTNO");
                String hiredate = rs.getString("HIREDATE");

                // EmpVO 객체 생성
                vo = new EmpVO(empno, ename, sal, deptno, hiredate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return vo;
    }

    // 데이터 삽입
    public void insertOne(EmpVO vo) {
        sb.setLength(0);
        sb.append("INSERT INTO EMP (EMPNO, ENAME, SAL, DEPTNO) ");
        sb.append("VALUES (?, ?, ?, ?)");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, vo.getEmpno());
            pstmt.setString(2, vo.getEname());
            pstmt.setInt(3, vo.getSal());
            pstmt.setInt(4, vo.getDeptno());

            pstmt.executeUpdate();
            System.out.println("직원 정보 삽입 성공");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 데이터 삭제
    public void deleteOne(int empno) {
        sb.setLength(0);
        sb.append("DELETE FROM EMP WHERE EMPNO = ?");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, empno);
            pstmt.executeUpdate();
            System.out.println("직원 정보 삭제 성공");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 데이터 업데이트
    public void updateOne(EmpVO vo) {
        sb.setLength(0);
        sb.append("UPDATE EMP SET ");
        sb.append("ENAME = ?, SAL = ?, DEPTNO = ? ");
        sb.append("WHERE EMPNO = ?");

        try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setString(1, vo.getEname());
            pstmt.setInt(2, vo.getSal());
            pstmt.setInt(3, vo.getDeptno());
            pstmt.setInt(4, vo.getEmpno());

            int result = pstmt.executeUpdate();
            if (result > 0) {
                System.out.println("직원 정보 업데이트 성공");
            } else {
                System.out.println("해당 직원이 존재하지 않음");
            }
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}