package com.book.shop;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
				
		return "StudentManagement";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/gotoJoin", method = RequestMethod.GET)
	public String gotoJoin() {
				
		return "joinForm";
	}
	
	@RequestMapping(value = "/gotologin", method = RequestMethod.GET)
	public String gotologin() {
				
		return "login";
	}
	
	@RequestMapping(value="/getTime", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String getTime() {
		Date date = new Date();
		
		SimpleDateFormat time = new SimpleDateFormat("yyyy년 MM월 dd일 EEE, HH:mm:ss");
		String result =time.format(date);
		//헤더를 정해주지 않았기 때문에 인코딩값이 정해지지 않았기때문에 
		
		
		return result;
	}
	
}
