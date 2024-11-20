package day02;

import java.util.Arrays;

// NewLotto nl = new NewLotto(3);
// 생성자의 숫자는 반복할 횟수
// nl.println();
// 1회 : 
// 2회 :
// 3회 : 
public class NewLotto {
	// 로또 반복 출력 횟수를 담을 변수
	private int cnt = 0;

	// 1부터 45 값을 담을 변수
	private int[] rnd = new int[45];
	
	// 당첨번호를 저장한 배열
	private int [] m = new int[6];

	public NewLotto(int cnt) {
		this.cnt = cnt;

		for (int i = 0; i < rnd.length; i++) {
			rnd[i] = i + 1;
		}
	} // 생성자 끝

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int[] getRnd() {
		return rnd;
	}

	public void setRnd(int[] rnd) {
		this.rnd = rnd;
	}

	public int[] getM() {
		return m;
	}

	public void setM(int[] m) {
		this.m = m;
	}

	public void shuffle() {
		
		// 두 수 랜덤하게 구하기
		// 자리바꿈
		for (int i = 0; i < 1000; i++) {
			int a = (int) (Math.random() * 45);
			int b = (int) (Math.random() * 45);
			int temp = 0;
			temp = rnd[a];
			rnd[a] = rnd[b];
			rnd[b] = temp;
		}

		// 이걸 천번 반복
	}
	
	// 당첨번호 뽑기
	public void select() {
		for (int i = 0; i < 6; i++) {
			m[i] = rnd[i];
			
		}
		
	}
	
	public void sort() {
		Arrays.sort(m); // m배열의 모든 요소를 정렬
		
	}
	
	public void print() {
		for (int i = 0; i < cnt; i++) {
			shuffle();
			select();
			sort();
			System.out.println(Arrays.toString(m));
			
		}
		
	}
}
