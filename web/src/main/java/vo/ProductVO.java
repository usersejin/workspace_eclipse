package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	private int pno;
	private String pname;
	private int price;
	private int qty;
	private String prodesc;
	private int dcratio;
	private String imgfile;
	private String bigfile;
	
}
