package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.FileVO;

public class FileDAO {
	
	// 1. 환경변수
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String user = "scott";
	final static String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public FileDAO() {
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

	// 모두 조회 selectAll()
	public ArrayList<FileVO> selectAll() {
		ArrayList<FileVO> list = new ArrayList<>();

		sb.setLength(0);
		sb.append("SELECT NO, TITLE, WRITER, CONTENTS, FILENAME ");
		sb.append("FROM FILEUPLOADTEST");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("contents");
				String filename = rs.getString("filename");
				list.add(new FileVO(no, title, writer, writer, filename));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	// 한건 조회 selectOne(int no)
	public FileVO selectOne(int no) {
		sb.setLength(0);
		sb.append("SELECT NO, TITLE, WRITER, CONTENTS, FILENAME ");
		sb.append("FROM FILEUPLOADTEST ");
		sb.append("WHERE NO = ? ");

		FileVO vo = new FileVO();

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String title = rs.getString("title");
				String writer = rs.getString("contents");
				String filename = rs.getString("filename");

				vo = new FileVO(no, title, writer, writer, filename);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	// 한건 삽입 addOne(FileVO vo)
	public void addOne(FileVO vo) {
		
		sb.setLength(0);
		sb.append("INSERT INTO FILEUPLOADTEST (NO, TITLE, WRITER, CONTENTS, FILENAME)  VALUES (PRODUCT_PNO_SEQ.NEXTVAL, ?, ?, ?, ?)");
	
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContents());
			pstmt.setString(4, vo.getFilename());
			

			// 6. 실행
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	
	}
			
}
