package com.sist.movie.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.UserDao;

@RestController
public class loginRestController {
	
	@Inject
	UserDao dao;
	
	@PostMapping(value = "loginpopup.do")
	public String ajaxLoginAction(String id, String pw,HttpSession	session) { 
		boolean state = dao.loginBoard(id, pw);
		if(state) { 
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(600);
			return "Success";
		}
		return "Fail";
	}
	
}
