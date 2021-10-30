package com.sist.movie.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.UserDao;

@RestController
public class LoginController {

	@Autowired
	UserDao dao;

	//Login 

	@PostMapping(value = "loginpopup.do")
	public String ajaxLoginAction(String id, String pw, HttpSession session) {
		boolean state = dao.loginBoard(id, pw);
		String verify = "1";
		if (state) {

			session.setAttribute("id", id);
			session.setAttribute("password", pw);
			session.setMaxInactiveInterval(600);

			
			boolean adminState = dao.adminloginBoard(id, verify);
			//Admin Login
			if (adminState) {
				session.setAttribute("verify", verify);
				System.out.println("success adminSuccess");
				return "adminSuccess";
			}

			else {
				System.out.println("fail adminSuccess");
				System.out.println(adminState);

			}
			return "Success";
		}
		return "Fail";
	}

	

	@PostMapping(value = "logout.do")
	@ResponseBody // ajax
	public void ajaxLogOutAction(HttpServletRequest request) {

		System.out.println("LogOut Process..");
		HttpSession session = request.getSession();
		session.invalidate();

	}

}
