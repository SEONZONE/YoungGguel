package com.sist.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.movie.dao.UserDao;
import com.sist.movie.vo.UserVO;

@Controller
public class JoinController {
	
	@Autowired
	private UserDao dao;
	
	@ResponseBody
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public int insertUser(UserVO vo) {
		int success; 
		try {
			dao.insertUser(vo);
			success = 1;
		} catch (Exception e) {
			success = -1;
		}
		return success;
	}
	
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public int idCheck(String id) {
		int count = dao.idCheck(id);
		return count;
	}
	
	
}