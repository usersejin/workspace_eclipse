package kr.co.jhta.web.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardVO {

	int bno;
	String writer;
	String title;
	String contents;
	String regdate;
	int hits;
	String ip;
	int status;
	

}

