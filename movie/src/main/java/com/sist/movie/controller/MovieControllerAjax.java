package com.sist.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.movie.dao.MovieDao;
import com.sist.movie.vo.MovieVO;

@RestController
public class MovieControllerAjax {

	@Autowired
	private MovieDao dao;
	
	@RequestMapping(value = "ajaxMovieList.do")
	public List<MovieVO> ajaxMovieList(String view) {	
		if(view.equals("poster")) {
			return dao.movieList();			
		}else if(view.equals("current")) {
			return dao.currentMovieList();
		}else{
			return dao.laterMovieList();
		}
	}
	
	@RequestMapping(value = "ajaxMain.do")
	public List<MovieVO> ajaxMain(String key) {	
		if(key.equals("main")) {
			return dao.mainPopularList();		
		}else if(key.equals("onAir")) {
			return dao.mainOnAirList();
		}else if(key.equals("scheduled")){
			return dao.mainScheduledList();
		}
		return null;
	}
	
	/*@RequestMapping("ajaxSearch.do")
	public movieVO ajaxSearch(String search) {
		return dao.searchMovie(search);
	}*/
}
