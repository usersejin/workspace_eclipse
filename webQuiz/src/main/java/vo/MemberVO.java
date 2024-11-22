package vo;


public class MemberVO {
	
	int memno;
	String name;
	String id;
	String pw;
	String regdate;
	String gender;
	String motive;
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMotive() {
		return motive;
	}
	public void setMotive(String motive) {
		this.motive = motive;
	}
	
	public MemberVO() {
		
		
	}
	
	
	public MemberVO(int memno, String name, String id, String pw, String regdate, String gender, String motive) {
		super();
		this.memno = memno;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.regdate = regdate;
		this.gender = gender;
		this.motive = motive;
	}

}
