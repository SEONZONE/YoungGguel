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
	
	
	/* �α��� �˾� �޼ҵ� */
	
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
	
	/* �α׾ƿ� �˾� �޼ҵ� */
	
	@PostMapping(value = "logout.do")
	@ResponseBody // ajax �� ���ؼ� ������ ��û�� �ϴ� ������� �ۼ��ؾ��� 
	public void ajaxLogOutAction(HttpServletRequest request) { 
	
		System.out.println("�񵿱� �α׾ƿ� �޼��� ����..");
		HttpSession session  = request.getSession();
		session.invalidate();
		
	}
	
}