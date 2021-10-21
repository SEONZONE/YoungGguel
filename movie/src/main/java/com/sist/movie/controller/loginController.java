package com.sist.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.movie.dao.UserDao;

@Controller
public class loginController {
	
	@Autowired
	private UserDao dao;
	
	@RequestMapping("loginpopup_do.do")
	public String loginCheck(HttpSession session,HttpServletRequest request) { 
		System.out.println(request.getParameter("id") + " "  + request.getParameter("password"));
		boolean state = dao.loginBoard(request.getParameter("id"), request.getParameter("password"));
		if (state) {
			session.setAttribute("id", request.getParameter("id"));
			session.setMaxInactiveInterval(60);
		}
		System.out.println("SUCCESS!");
		return state ? "redirect:loginGNB.jsp" : "redirect:loginpopup.jsp";
		
	}
	
	
}
