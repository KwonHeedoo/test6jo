package VO;

public class Book {
	private String bookcode;
	private String title;
	private int price;
	private int quantity;
	private int saleAll; // 판매총량 받아올값
	
	public Book() {
		super();
	}

	public Book(String bookcode, String title, int price, int quantity) {
		super();
		this.bookcode = bookcode;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
		this.saleAll=0;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getSaleAll() {
		return saleAll;
	}

	public void setSaleAll(int saleAll) {
		this.saleAll = saleAll;
	}

	@Override
	public String toString() {
		return "Book [bookcode=" + bookcode + ", title=" + title + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
}
