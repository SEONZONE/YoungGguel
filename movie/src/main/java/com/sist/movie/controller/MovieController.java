package com.sist.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.movie.dao.MovieDao;

@Controller
public class MovieController {
    //get,post를 써야함
	//get 데이터 부를때 select해서 보여줄때
	//post 회원가입 등록
	//put 회원정보 업데이트, 딜리트 
	@Autowired
	private MovieDao dao;

	@RequestMapping("movieList.do")
	public String movieListAction(Model model, String view) {
		if (view.equals("poster")) {
			model.addAttribute("movieList", dao.movieList());
			return "view/jsp/list-poster";
		}else if(view.equals("current")){
			model.addAttribute("movieList", dao.currentMovieList());
			return "view/jsp/list-poster";
		}else {
			model.addAttribute("movieList", dao.laterMovieList());
			return "view/jsp/list-poster";
		}
	}
	@GetMapping(value = "movieInfo.do")
	public String boardInfoAction(int no, Model model) {
		model.addAttribute("info", dao.selectInfoMovie(no));
		return "view/jsp/movie_info";
	}
	@RequestMapping("movieSearch.do")
	public String movieSearch(String search, Model model) {
		model.addAttribute("result", dao.searchMovie(search));
		return "view/jsp/movie_search";
	}
	/*@RequestMapping(value = "ajaxMovieList.do")
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
			return dao.mainCurrentList();		
		}else if(key.equals("current")) {
			return dao.mainCurrentList();
		}else{
			return dao.mainPlanning();
		}
	}*/
}
