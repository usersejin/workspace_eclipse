package test;

public class TestMain {
	public static void main(String[] args) {
		
		
		int num = 119800;
		String formatString = String.format("%,d", num);
		float num1 = 119800.00f;
		String formatString1 = String.format("%,.2f", num1);
		System.out.println(formatString);
		System.out.println(formatString1);
	}
}
