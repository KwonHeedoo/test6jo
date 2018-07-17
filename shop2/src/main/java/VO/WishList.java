package VO;

public class WishList {
	private String userid;
	private String bookcode;
	private String title;
	private int price;

	public WishList() {
		super();
	}

	public WishList(String userid, String bookcode) {
		super();
		this.userid = userid;
		this.bookcode = bookcode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getBookcode() {
		return bookcode;
	}

	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}


}
