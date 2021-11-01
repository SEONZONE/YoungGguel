package com.sist.movie.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.MovieVO;
import com.sist.movie.vo.TheaterVO;

@Controller
@RequestMapping(value="/scheduler")
public class SchedulerController {
	
	@Autowired
	private SchedulerDao dao;
	
	@RequestMapping(value="/mainloding.do")
	@ResponseBody
	public List<?> selectschedulerList(String select,String city) {
		if(select.equals("movie")) {
			return dao.selectMovieList();
		}else if(select.equals("theater")){
			return dao.selecttheaterList(city);
		}
		return dao.selectMovieList();
	}
	
	@RequestMapping(value="/main.do")
	public String schedulerAction(Model model) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd", Locale.KOREA);
		SimpleDateFormat sdf3 = new SimpleDateFormat("E", Locale.KOREA);
		List<String> yymmdd = new ArrayList<String>();		
		List<String> day = new ArrayList<String>();		
		List<String> yoil = new ArrayList<String>();
		calendar.add(calendar.DATE, 0);
		yymmdd.add(sdf1.format(calendar.getTime()));
		day.add(sdf2.format(calendar.getTime()));
		yoil.add(sdf3.format(calendar.getTime()));
		for (int i = 0; i < 19; i++) {
			calendar.add(calendar.DATE, +1);
			yymmdd.add(sdf1.format(calendar.getTime()));
			day.add(sdf2.format(calendar.getTime()));
			yoil.add(sdf3.format(calendar.getTime()));
		}
		List<TheaterVO> city = dao.selecttheatercity();
		model.addAttribute("list1", yymmdd);
		model.addAttribute("list2", day);
		model.addAttribute("list3", yoil);
		model.addAttribute("city", city);
		return "view/jsp/scheduler";
	}
	
	@RequestMapping("gwanList.do")
	@ResponseBody
	public List<BookVO> selectGwanList(String moviename, String town, String date) {
		BookVO vo = new BookVO();
		vo.setBookingMovieName(moviename);
		vo.setBookingTown(town);
		vo.setBookingDate(date);
		return dao.selectGwanList(vo);
	}
	
	@RequestMapping("gwanMovieList.do")
	@ResponseBody
	public List<BookVO> selectmovieList(String town, String date) {
		System.out.println(town+date);
		BookVO vo = new BookVO();
		vo.setBookingTown(town);
		vo.setBookingDate(date);
		System.out.println(dao.selectGwanMovieList(vo));
		return dao.selectGwanMovieList(vo);
	}
	

	
	
	
}
