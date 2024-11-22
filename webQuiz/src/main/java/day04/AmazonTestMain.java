package day04;

import dao.AmazonDAO;
import vo.AmazonVO;

public class AmazonTestMain {
	public static void main(String[] args) {

		AmazonDAO dao = new AmazonDAO();
		AmazonVO vo = new AmazonVO(0, "둘리", "dooly@gmail.com", "ccc" );
		
//		dao.insertOne(vo);
		
		AmazonVO vo1 = dao.findOneByEmail("dooly@gmail.com", "ccc");
		System.out.println(vo1);

	}

}
