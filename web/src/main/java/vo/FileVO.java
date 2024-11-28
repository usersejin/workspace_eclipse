package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private String filename;

}
