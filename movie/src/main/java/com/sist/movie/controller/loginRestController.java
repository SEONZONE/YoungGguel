package com.sist.movie.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.UserDao;

@RestController
public class loginRestController {
	
	@Inject
	UserDao dao;
	
	
	/* 로그인 팝업 메소드 */
	
	@PostMapping(value = "loginpopup.do")
	public String ajaxLoginAction(String id, String pw,HttpSession	session) { 
		boolean state = dao.loginBoard(id, pw);
		if(state) { 
			
			session.setAttribute("id", id);
			session.setAttribute("password",pw);
			session.setMaxInactiveInterval(600);
			return "Success";
		}
		return "Fail";
	}
	
	/* 로그아웃 팝업 메소드 */
	
	@PostMapping(value = "logout.do")
	@ResponseBody // ajax 를 통해서 서베어 요청을 하는 방식으로 작성해야함 
	public void ajaxLogOutAction(HttpServletRequest request) { 
	
		System.out.println("비동기 로그아웃 메서드 진입..");
		HttpSession session  = request.getSession();
		session.invalidate();
		
	}
	
}
