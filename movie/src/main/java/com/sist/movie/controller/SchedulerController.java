package com.sist.movie.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.movie.dao.SchedulerDao;
import com.sist.movie.vo.MovieVO;
import com.sist.movie.vo.TheaterVO;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {
	
	@Autowired
	private SchedulerDao dao;
	
	@RequestMapping(value="/mainloding.do")
	@ResponseBody
	public List<?> selectschedulerList(String select,String city) {
		System.out.println(city);
		if(select.equals("movie")) {
			return dao.selectMovieList();
		}else if(select.equals("theater")){
			return dao.selecttheaterList(city);
		}
		return dao.selectMovieList();
	}
	
	
	
	
	
	@RequestMapping(value="/main.do")
	public String schedulerAction(Model model) {
		List<TheaterVO> city = dao.selecttheatercity();
		model.addAttribute("city", city);
		return "/view/jsp/scheduler";
	}
	

	
	
	
}
