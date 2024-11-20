package dao;

import java.util.ArrayList;

import vo.DeptVO;

public class TestMain {
	public static void main(String[] args) {
		DeptDAO dao = new DeptDAO();

		DeptVO vo = dao.selectOne(10);
		ArrayList<DeptVO> list = dao.selectAll();

		System.out.println(vo.getDeptno() + " | " + vo.getDeptno() + " | " + vo.getLoc());
		for (DeptVO vo1 : list) {
			System.out.println(vo1.getDeptno() + " | " + vo1.getDname() + " | " + vo1.getLoc());
		}

		// insert
		dao.insertOne(new DeptVO(70, "인사", "경주"));
		
		// update
		dao.updateOne(new DeptVO(31, "보안", "청주"));
	}

}


