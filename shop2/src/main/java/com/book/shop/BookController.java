package com.book.shop;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DAO.BookMapper;
import VO.Book;
import VO.Sale;
import VO.Shopmember;
import VO.WishList;

@Controller
public class BookController {
//건들여 봤음-byㅎㄷ 
	// 나도 건드려봄 -by ㅈㅅ
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/booklist", method = RequestMethod.GET)
	public String booklist(Model model) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		List<Book>booklist = dao.findAllBooks();
		
		model.addAttribute("booklist", booklist);
		
		return "bookList";
	}
	
	@RequestMapping(value = "/itemView", method = RequestMethod.GET)
	public String itemView(String bookcode, Model model) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		Book book =dao.findBook(bookcode);
		System.out.println(book);
		
		model.addAttribute("book",book);
		
		return "itemView";
	}
	
	@RequestMapping(value = "/buying", method = {RequestMethod.GET, RequestMethod.POST})
	public String buying(String bookcode, Model model, String userid, String orderNum) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		int purchasecnt= Integer.parseInt(orderNum);
		Sale s= new Sale(userid, bookcode, purchasecnt);
		
		int cnt1= dao.insertSale(s);
		int cnt2=dao.updateQuantity(bookcode, purchasecnt);
		// 만약 수정이나 재고 입력 실패시에 주문실패함이라는 메세지를 띄우고 다시 본래 아이템뷰 페이지로 보내자...
		return "redirect:orderList";
	}

	@RequestMapping(value = "/addWishList", method = {RequestMethod.GET, RequestMethod.POST})
	public String wishList(WishList wl, Model model) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		
		int cnt = dao.insertWishList(wl);
		// 실패시 로직 생각해놓기 
		return "redirect:wishList";
	}

	@RequestMapping(value = "/orderList", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderList(Model model, HttpSession session) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);		
		Shopmember m= (Shopmember) session.getAttribute("userInfo");
		System.out.println(m);
		String userid= m.getUserid();
		
		System.out.println(userid);
		List<Sale> orderlist=dao.orderList(userid);
		int sum=0;
		for (int i = 0; i < orderlist.size(); i++) {
			sum += orderlist.get(i).getPurchaseSum();
		}
		
		if(orderlist!=null) {
			model.addAttribute("orderlist", orderlist);
			model.addAttribute("sum", sum);
		}
		
		return "orderList";
	}
	
	@RequestMapping(value = "/wishList", method = RequestMethod.GET)
	public String wishList(Model model, HttpSession session) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		Shopmember m= (Shopmember) session.getAttribute("userInfo");
		System.out.println(m);
		String userid= m.getUserid();

		List<WishList> wishlist= dao.wishList(userid);
		
		if(wishlist!=null) {
			model.addAttribute("wishlist", wishlist);
		}		
		return "wishList";
	}	
	
	@RequestMapping(value = "/deleteWishlist", method = RequestMethod.GET)
	public String deleteWishList(Model model, HttpSession session, String bookcode) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		Shopmember m= (Shopmember) session.getAttribute("userInfo");
		String userid= m.getUserid();
		int cnt = dao.deleteList(bookcode, userid);
		
		if(cnt>0) { //
			model.addAttribute("result", true);
		}
		return "redirect:wishList";
	}
	
	@RequestMapping(value = "/bestseller", method = RequestMethod.GET)
	public String bestSeller(Model model) {
		BookMapper dao= sqlsession.getMapper(BookMapper.class);
		Book best =dao.findBestSeller();
		
		model.addAttribute("bestseller", best);
		
		return "bestSeller";
	}
}
