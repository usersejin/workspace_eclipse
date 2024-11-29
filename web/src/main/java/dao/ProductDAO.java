package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.MemberVO;
import vo.ProductVO;

public class ProductDAO {
	
	// 1. 환경변수
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String user = "scott";
	final static String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public ProductDAO() {
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
		public ArrayList<ProductVO> selectAll(){
			ArrayList<ProductVO> list = new ArrayList<ProductVO>();
			
			sb.setLength(0);
			sb.append("SELECT PNO, PNAME, PRICE, QTY, PRODESC, DCRATIO, IMGFILE, BIGFILE ");
			sb.append("FROM PRODUCT");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int pno = rs.getInt("pno");
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String prodesc = rs.getString("prodesc");
					int dcratio = rs.getInt("dcratio");
					String imgfile = rs.getString("imgfile");
					String bigfile = rs.getString("bigfile");
					list.add(new ProductVO(pno, pname, price, qty, prodesc, dcratio, imgfile, bigfile));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return list;
		}

		// 한건 조회
		public ProductVO selectOne(int pno) {
			// 4. SQL 문 작성
			sb.setLength(0);
			sb.append("SELECT PNO, PNAME, PRICE, QTY, PRODESC, DCRATIO, IMGFILE, BIGFILE ");
			sb.append("FROM PRODUCT ");
			sb.append("WHERE PNO = ?");

			ProductVO vo = null;
			try {
				// 5. 문장객체
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);

				// 6. 실행
				rs = pstmt.executeQuery();

				// 7. 로직 처리
				while (rs.next()) {
					String pname = rs.getString("pname");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String prodesc = rs.getString("prodesc");
					int dcratio = rs.getInt("dcratio");
					String imgfile = rs.getString("imgfile");
					String bigfile = rs.getString("bigfile");
					vo = new ProductVO(pno, pname, price, qty, prodesc, dcratio, imgfile, bigfile);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			return vo;
		}
		
		public ProductVO findByname(String pname) {
			sb.setLength(0);
			sb.append("SELECT PNO, PNAME, PRICE, QTY, PRODESC, DCRATIO, IMGFILE, BIGFILE ");
			sb.append("FROM PRODUCT ");
			sb.append("WHERE PNAME LIKE ?");
			
			ProductVO vo = null;

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, "%" + pname + "%"); // 여기에 %를 붙이면 돼
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					int pno = rs.getInt("pno");
					int price = rs.getInt("price");
					int qty = rs.getInt("qty");
					String prodesc = rs.getString("prodesc");
					int dcratio = rs.getInt("dcratio");
					String imgfile = rs.getString("imgfile");
					String bigfile = rs.getString("bigfile");
					vo = new ProductVO(pno, pname, price, qty, prodesc, dcratio, imgfile, bigfile);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
			
		}

		// insert
		public void insertOne(ProductVO vo) {
			// 4. SQL문 작성
			sb.setLength(0);
			sb.append("INSERT INTO PRODUCT (PNO, PNAME, PRICE, QTY, PRODESC, DCRATIO, IMGFILE, BIGFILE)  VALUES (FILEUPLOADTEST_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)");

			try {
				// 5. 문장 객체
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPname());
				pstmt.setInt(2, vo.getPrice());
				pstmt.setInt(3, vo.getQty());
				pstmt.setString(4, vo.getProdesc());
				pstmt.setInt(5, vo.getDcratio());
				pstmt.setString(6, vo.getImgfile());
				pstmt.setString(7, vo.getBigfile());

				// 6. 실행
				pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// update
		public void updateOne(ProductVO vo) {
			sb.setLength(0);
			sb.append("UPDATE PRODUCT SET PNAME = ?, PRICE = ?  WHERE PNO = ?");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getPname());
				pstmt.setInt(2, vo.getPrice());
				pstmt.setInt(3, vo.getPno());

				pstmt.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// delete
		public void deleteOne(int pno) {
			sb.setLength(0);
			sb.append("DELETE FROM PRODUCT WHERE PNO = ?");

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, pno);

				pstmt.executeQuery();
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
