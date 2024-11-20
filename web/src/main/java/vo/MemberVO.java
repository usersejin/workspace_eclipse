package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	
	int memno;
	String name;
	String id;
	String pw;
	String regdate;
	String gender;
	String motive;

}
