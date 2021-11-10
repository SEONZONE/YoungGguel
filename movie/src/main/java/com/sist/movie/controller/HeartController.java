package com.sist.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.HeartDao;
import com.sist.movie.vo.HeartVO;

@RestController
public class HeartController {

	@Autowired
	private HeartDao dao;
	
	@ResponseBody
	@RequestMapping("heart.do")
	public int like(HeartVO vo, String heart) {
		int code=vo.getMovieCd();
		if(heart.equals("insert")) {
			dao.heartInsert(vo);
			return dao.heartCount(code);			
		}else{
			dao.heartDelete(vo);
			return dao.heartCount(code);
		}
	}

}
