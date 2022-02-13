package dto;

public class MovieMemberVO {
	private String id;
	private String pw;
	private int born;
	
	public MovieMemberVO(String id,String pw, int born) {
		this.id=id;
		this.pw=pw;
		this.born=born;

	}
	public void setID(String id) {
		this.id=id;
	}
	public String getID() {
		return id;
	}
	public void setPW(String pw) {
		this.pw=pw;
	}
	public String getPW() {
		return pw;
	}
	public void setBorn(int born) {
		this.born=born;
	}
	public int getBorn() {
		return born;
	}
}
