package com.sist.movie.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.BookDao;
import com.sist.movie.dao.MovieDao;
import com.sist.movie.dao.TheaterDao;
import com.sist.movie.vo.BookVO;
import com.sist.movie.vo.MovieVO;

@Controller
public class BookingController {
	
	@Autowired
	private MovieDao mdao;
	
	@Autowired
	private TheaterDao tdao;
	
	@ResponseBody
	
	@RequestMapping(value ="nameList.do")
	public List<?> movieListAction(String select,String city) {
		System.out.println("select : " + select);
		System.out.println("city : " + city);
		if(select.equals("movieList")) {
			return mdao.movieList();	
		}
		
		else if(select.equals("cityList")) { 
			System.out.println(tdao.theaterCity());
			return tdao.theaterCity();
			
		}
		else if(select.equals("townList")) { 
			System.out.println(tdao.theaterTown());
			return tdao.theaterTown();
			
		}
		return  mdao.movieList();	
		
	}
	
}
