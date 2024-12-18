package day15;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/payment/add")
public class Payment extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String paymentId = req.getParameter("paymentId");
		String txId = req.getParameter("txId"); // 트랜잭션 아이디 
		String orderName = req.getParameter("orderName");
		String totalAmount = req.getParameter("totalAmount");
		
		System.out.println("paymentId " + paymentId);
		System.out.println("txId " + txId);
		System.out.println("orderName " + orderName);
		System.out.println("totalAmount " + totalAmount);
		
		// db에 이 내용을 저장 : 결제 정보를 .. 
	}

}
