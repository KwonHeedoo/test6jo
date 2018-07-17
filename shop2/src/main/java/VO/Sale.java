package VO;

public class Sale {
	private String userid;
	private String title;
	private int price;	
	private String bookcode;
	private int purchasecnt;
	private String purchaseDate;
	private int purchaseSum;
	
	public Sale(String userid, String bookcode, int purchasecnt) {
		super();
		this.userid = userid;
		this.bookcode = bookcode;
		this.purchasecnt = purchasecnt;
		this.purchaseDate = null;
	}
	
	public int getPurchaseSum() {
		return purchaseSum;
	}

	public void setPurchaseSum(int purchaseSum) {
		this.purchaseSum = purchaseSum;
	}

	public Sale() {
		super();
		// TODO Auto-generated constructor stub
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

	public int getPurchasecnt() {
		return purchasecnt;
	}

	public void setPurchasecnt(int purchasecnt) {
		this.purchasecnt = purchasecnt;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
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

	@Override
	public String toString() {
		return "Sale [userid=" + userid + ", title=" + title + ", price=" + price + ", bookcode=" + bookcode
				+ ", purchasecnt=" + purchasecnt + ", purchaseDate=" + purchaseDate + ", purchaseSum=" + purchaseSum
				+ "]";
	}

	

}
