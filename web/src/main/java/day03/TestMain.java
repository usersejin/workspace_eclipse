package day03;

import java.util.ArrayList;

import dao.DeptDAO;
import dao.MemberDAO;
import vo.DeptVO;
import vo.MemberVO;

public class TestMain {
	public static void main(String[] args) {
//		DeptDAO dao = new DeptDAO();
//
////		DeptVO vo = dao.selectOne(10);
//		ArrayList<DeptVO> list = dao.selectAll();
//
////		System.out.println(vo.getDeptno() + " | " + vo.getDeptno() + " | " + vo.getLoc());
//		for (DeptVO vo1 : list) {
//			System.out.println(vo1.getDeptno() + " | " + vo1.getDname() + " | " + vo1.getLoc());
//		}

		// insert
//		DeptVO vo2 = new DeptVO(0, "기획", "서울");
////		dao.insertOne(vo2);
//
//		// update
////		dao.updateOne(new DeptVO(31, "보안", "청주"));
//		vo2.setDeptno(6);
//		vo2.setDname("IT");
//		vo2.setLoc("부산");
//
//		// delete
//		dao.deletOne(6);
//
//		dao.close();

		MemberDAO dao = new MemberDAO();
//		dao.insertOne(new MemberVO(0, "김도연", "kimdoyeon", "aaa", "2024-11-20", "여", "그냥"));
//		dao.insertOne(new MemberVO(0, "천세진", "cheonsejin", "bbb", "2024-11-20", "여", "그냥"));
//		dao.insertOne(new MemberVO(0, "조형윤", "johy", "ccc", "2024-11-20", "남", "그냥"));
//		dao.insertOne(new MemberVO(0, "이영연", "youngyeon", "ddd", "2024-11-20", "여", "그냥"));
//		dao.insertOne(new MemberVO(0, "배서연", "baesy", "eee", "2024-11-10", "여", "그냥"));

//		dao.updateOne(new MemberVO(5, "김도연", "kimdy", "aaa", "2024-11-20", "여", "그냥") );
//		dao.updateOne(new MemberVO(6, "천세진", "cheonsj", "bbb", "2024-11-20", "여", "그냥") );
//		dao.updateOne(new MemberVO(7, "조형윤", "johy", "ccc", "2024-11-20", "남", "그냥") );
//		dao.updateOne(new MemberVO(8, "이영연", "leeyy", "ddd", "2024-11-20", "여", "그냥") );
		dao.updateOne(new MemberVO(13, "배서연", "baesy", "eee", null, "여", "그냥"));
	
		
	
	}

}
