package com.book.shop;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import DAO.ShopmemberMapper;
import VO.Shopmember;

@Controller
public class MemberController {

	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Shopmember vo,HttpSession session, Model model) {				
		ShopmemberMapper dao= sqlsession.getMapper(ShopmemberMapper.class);
		Shopmember s1 =dao.findMember(vo);
		
		if(s1!=null) {
			session.setAttribute("userInfo", s1);
			return "index";			
		}else {
			model.addAttribute("loginResult", false);
			return "login";
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String Join(Shopmember vo,Model model) {				
		System.out.println(vo);
		ShopmemberMapper dao= sqlsession.getMapper(ShopmemberMapper.class);
		int cnt = dao.insertMember(vo);
		System.out.println(cnt);
		if(cnt>0) {
			model.addAttribute("joinResult", true);
			
			return "index";
		}else {
			model.addAttribute("joinResult", false);
			return "joinForm";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.GET)
	public @ResponseBody boolean idCheck(String userid) {
		System.out.println(userid);
		ShopmemberMapper dao= sqlsession.getMapper(ShopmemberMapper.class);
		Shopmember m= dao.idCheck(userid);
		System.out.println(m);
		if(m!=null) {
			return true;
		}else {
			return false;
		}
	}
}