package com.sist.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.movie.dao.UserDao;
import com.sist.movie.vo.UserVo;

@Controller
public class joinController {
	
	@Autowired
	private UserDao dao;
	
	@RequestMapping(value="join.do")
	public String insertUser(UserVo vo) {
		System.out.println("hi");
		dao.insertUser(vo);
		return "view/jsp/main";
	}
	
	@RequestMapping(value="idCheck.do")
	public int idCheck(String id) {
		System.out.println(id);
		return 0;
	}
	
	
}
