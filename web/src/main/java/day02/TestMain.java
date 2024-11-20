package day02;

import java.util.Arrays;

public class TestMain {
	public static void main(String[] args) {
		NewLotto nl = new NewLotto(3);
		nl.print();
		int [] m = nl.getM();
		
		System.out.println(Arrays.toString(m));
	}
}
