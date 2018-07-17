package DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import VO.Book;
import VO.Sale;
import VO.WishList;

public interface BookMapper {
	
	public List<Book> findAllBooks();
	public Book findBestSeller();
	public Book findBook(String bookcode);
	public int updateQuantity(@Param("bookcode") String bookcode,@Param("purchasecnt") int purchasecnt);
	public int insertSale(Sale vo);
	public List<Sale> orderList(String userid);
	public List<WishList> wishList(String userid);
	public Integer insertWishList(WishList wl);
	public int deleteList(@Param("bookcode")String bookcode, @Param("userid")String userid);

}
